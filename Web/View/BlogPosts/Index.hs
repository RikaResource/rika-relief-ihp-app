module Web.View.BlogPosts.Index where
import Web.View.Prelude

import qualified Text.MMark as MMark
import qualified Data.Text as T
import qualified Text.Blaze.Html



data IndexView = IndexView { blogPosts :: [BlogPost]  }

instance View IndexView where
    html IndexView { .. } = 
      case blogPosts of 
        [] -> [hsx|
          <div class="Blog">
              {renderNavBar}
              <div class="blog-content">
                <div class="blog-intro">
                  {renderEmptyBlog}
                </div>
              </div>
          </div>
        |]
        xs -> [hsx|
          <div class="Blog">
            {renderNavBar}
              <div class="blog-content">
                <div class="blog-intro">
                  
                </div>
                <div class="blog-post-list">
                  <ul class="posts-list">
                    {forEach blogPosts renderBlogPost}
                  </ul>
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
    <div class="blog-post-item-wrapper">
      <li class="blog-post-list-item">
        <div class="blog-post-item-card">
          <h3 class="post-item-header"><a href={ShowBlogPostAction blogPost.id}>{blogPost.title}</a></h3>
          <p class="post-item-subhead">By {head $ blogPost.tags} at {blogPost.createdAt |> dateTime}</p>
          <div class="post-item-teaser">{blogPost.postTeaser |> renderShortMarkdown}</div>
          <a href={ShowBlogPostAction blogPost.id}>Read more</a>
        </div>
      </li>
    </div>
|]

renderEmptyBlog :: Html
renderEmptyBlog = [hsx|
    <div class="blog-post-empty-wrapper">
      <div class="blog-post-empty">
        <p>There are no blog posts currently, check back later</p>
      </div>
    </div>
|]

renderNavBar :: Html
renderNavBar = [hsx|
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
|]

renderShortMarkdown text = 
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml