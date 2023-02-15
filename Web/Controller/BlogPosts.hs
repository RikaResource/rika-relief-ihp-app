module Web.Controller.BlogPosts where

import Web.Controller.Prelude
import Web.View.BlogPosts.Index
import Web.View.BlogPosts.New
import Web.View.BlogPosts.Edit
import Web.View.BlogPosts.Show

import qualified Text.MMark as MMark

instance Controller BlogPostsController where
    action BlogPostsAction = do
        blogPosts <- query @BlogPost 
                |> orderByDesc #createdAt
                |> fetch
        render IndexView { .. }

    action ShowBlogPostAction { blogPostId } = do
        blogPost <- fetch blogPostId
                >>= pure . modify #comments (orderByDesc #createdAt)
                >>= fetchRelated #comments
        render ShowView { .. }

buildBlogPost blogPost = blogPost
    |> fill @["title", "body", "tags", "author", "post_teaser"]
    |> validateField #title nonEmpty
    |> validateField #body nonEmpty
    |> validateField #body isMarkdown


isMarkdown :: Text -> ValidatorResult
isMarkdown text = 
    case MMark.parse "" text of
        Left _  -> Failure "Please provide valid Markdown"
        Right _ -> Success