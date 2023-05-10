module Application.Helper.View(renderNavBar,footer) where

import IHP.ViewPrelude

-- Here you can add functions which are available in all your views

renderNavBar :: Html
renderNavBar = [hsx|
      <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-center home-nav">
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

footer ::  Html
footer =  [hsx|
        <footer class="footerclass">
            <div>
            <a href="https://infidyn.org" target="_blank" rel="noopener noreferrer">
                Powered by
                <img src="/symbollogo.svg" alt="InfiDyn" class="footerlogo" />
            </a>
                © All Rights Reserved
            </div>
        </footer>
    |]