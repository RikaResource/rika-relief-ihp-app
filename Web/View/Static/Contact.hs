module Web.View.Static.Contact where
import Web.View.Prelude

data ContactView = ContactView

instance View ContactView where
    html ContactView = [hsx|

    <div class="Contact">

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

        <div class="ContactContentWrapper">
          <div class="ContactContent">
            <p class="ContactParagraph">You can contact us at the following email address: <span class="ContactEmail">rikaRelief@protonmail.com</span></p>
          </div>
        </div>

    </div>
    
    |]