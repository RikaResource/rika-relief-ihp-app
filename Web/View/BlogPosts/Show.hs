module Web.View.BlogPosts.Show where
import Web.View.Prelude

data ShowView = ShowView { blogPost :: BlogPost }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>Show BlogPost</h1>
        <p>{blogPost}</p>

    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "BlogPosts" BlogPostsAction
                            , breadcrumbText "Show BlogPost"
                            ]