module Web.View.BlogPosts.New where
import Web.View.Prelude

data NewView = NewView { blogPost :: BlogPost }

instance View NewView where
    html NewView { .. } = [hsx|
        {breadcrumb}
        <h1>New BlogPost</h1>
        {renderForm blogPost}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "BlogPosts" BlogPostsAction
                , breadcrumbText "New BlogPost"
                ]

renderForm :: BlogPost -> Html
renderForm blogPost = formFor blogPost [hsx|
    {(textField #title)}
    {(textField #body)}
    {(textField #tags)}
    {submitButton}

|]