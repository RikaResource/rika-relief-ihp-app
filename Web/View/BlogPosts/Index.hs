module Web.View.BlogPosts.Index where
import Web.View.Prelude

data IndexView = IndexView { blogPosts :: [BlogPost]  }

instance View IndexView where
    html IndexView { .. } = [hsx|
        <div class="Blog">
            <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-center">
                  <div class="container-fluid">
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-center" id="navbarTogglerDemo01">
                      <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item">
                          <a class="nav-link" href="/home">Home</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="/about">About</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="/BlogPosts">Blog</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" href="/contact" tabindex="-1">Contact</a>
                        </li>
                      </ul>
                    </div>
                  </div>
                </nav>
            <div class="blog-content">
              <div class="blog-intro">
                <h1>Our Blog</h1>
              </div>
              <div class="blog-list">

              </div>
            </div>
        </div>
    |]
        where
            breadcrumb = renderBreadcrumb
                [ breadcrumbLink "BlogPosts" BlogPostsAction
                ]

renderBlogPost :: BlogPost -> Html
renderBlogPost blogPost = [hsx|
    <tr>
        <td><a href={ShowBlogPostAction blogPost.id}>{blogPost.title}</a></td>
    </tr>
|]