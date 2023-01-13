module Web.View.BlogPosts.Edit where
import Web.View.Prelude

data EditView = EditView { blogPost :: BlogPost }

instance View EditView where
    html EditView { .. } = [hsx|
        {breadcrumb}
        <h1>Edit BlogPost</h1>
        {renderForm blogPost}
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "BlogPosts" BlogPostsAction
                , breadcrumbText "Edit BlogPost"
                ]

renderForm :: BlogPost -> Html
renderForm blogPost = formFor blogPost [hsx|
    {(textField #title)}
    {(textField #body)}
    {(textField #tags)}
    {submitButton}

|]