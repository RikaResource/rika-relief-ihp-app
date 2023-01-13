module Web.View.BlogPosts.Index where
import Web.View.Prelude

data IndexView = IndexView { blogPosts :: [BlogPost]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        {breadcrumb}

        <h1>Index<a href={pathTo NewBlogPostAction} class="btn btn-primary ms-4">+ New</a></h1>
        <div class="table-responsive">
            <table class="table">
                <thead>
                    <tr>
                        <th>BlogPost</th>
                        <th></th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>{forEach blogPosts renderBlogPost}</tbody>
            </table>
            
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "BlogPosts" BlogPostsAction
                ]

renderBlogPost :: BlogPost -> Html
renderBlogPost blogPost = [hsx|
    <tr>
        <td>{blogPost}</td>
        <td><a href={ShowBlogPostAction blogPost.id}>Show</a></td>
        <td><a href={EditBlogPostAction blogPost.id} class="text-muted">Edit</a></td>
        <td><a href={DeleteBlogPostAction blogPost.id} class="js-delete text-muted">Delete</a></td>
    </tr>
|]