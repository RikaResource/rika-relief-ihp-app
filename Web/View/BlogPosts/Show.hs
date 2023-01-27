module Web.View.BlogPosts.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark

data ShowView = ShowView { blogPost :: Include "comments" BlogPost }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>{blogPost.title}</h1>
        <p>{blogPost.createdAt |> timeAgo}</p>
        <ul class="list-group list-group-horizontal">{forEach blogPost.tags renderBlogPostTag}</ul>
        <div>{blogPost.body |> renderMarkdown}</div>

        <a href={NewCommentAction blogPost.id}>Add Comment</a>
        <div>{forEach blogPost.comments renderComment}</div>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "BlogPosts" BlogPostsAction
                            , breadcrumbText "Show BlogPost"
                            ]


-- https://stackoverflow.com/questions/63699559/how-to-make-a-responsive-horizontal-list
renderBlogPostTag tag = [hsx|
        <li class="list-group-item">#{tag}</li>
|]

renderComment comment = [hsx|
        <div class="mt-4">
            <h6>{comment.author}</h6>
            <p>{comment.body}</p>
        </div>
    |]


renderMarkdown text = 
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml