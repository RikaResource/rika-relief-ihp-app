module Web.Controller.BlogPosts where

import Web.Controller.Prelude
import Web.View.BlogPosts.Index
import Web.View.BlogPosts.New
import Web.View.BlogPosts.Edit
import Web.View.BlogPosts.Show

instance Controller BlogPostsController where
    action BlogPostsAction = do
        blogPosts <- query @BlogPost |> fetch
        render IndexView { .. }

    action NewBlogPostAction = do
        let blogPost = newRecord
        render NewView { .. }

    action ShowBlogPostAction { blogPostId } = do
        blogPost <- fetch blogPostId
        render ShowView { .. }

    action EditBlogPostAction { blogPostId } = do
        blogPost <- fetch blogPostId
        render EditView { .. }

    action UpdateBlogPostAction { blogPostId } = do
        blogPost <- fetch blogPostId
        blogPost
            |> buildBlogPost
            |> ifValid \case
                Left blogPost -> render EditView { .. }
                Right blogPost -> do
                    blogPost <- blogPost |> updateRecord
                    setSuccessMessage "BlogPost updated"
                    redirectTo EditBlogPostAction { .. }

    action CreateBlogPostAction = do
        let blogPost = newRecord @BlogPost
        blogPost
            |> buildBlogPost
            |> ifValid \case
                Left blogPost -> render NewView { .. } 
                Right blogPost -> do
                    blogPost <- blogPost |> createRecord
                    setSuccessMessage "BlogPost created"
                    redirectTo BlogPostsAction

    action DeleteBlogPostAction { blogPostId } = do
        blogPost <- fetch blogPostId
        deleteRecord blogPost
        setSuccessMessage "BlogPost deleted"
        redirectTo BlogPostsAction

buildBlogPost blogPost = blogPost
    |> fill @["title", "body", "tags"]
