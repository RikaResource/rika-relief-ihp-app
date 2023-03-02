module Web.View.BlogPosts.Index where
import Web.View.Prelude
-- import Application.Helper.View

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
                  <h1 class="blog-intro-header">Our Blog</h1>
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
                  <h1 class="blog-intro-header">Our Blog</h1>
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
          <p class="post-item-subhead">By {blogPost.author} at {blogPost.createdAt |> dateTime}</p>
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
        <img class="no-posts-placeholder" src="./no-posts-holder-1200-675.svg">
      </div>
    </div>
|]


renderShortMarkdown text = 
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml