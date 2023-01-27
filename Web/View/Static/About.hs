module Web.View.Static.About where
import Web.View.Prelude

data AboutView = AboutView

instance View AboutView where
    html AboutView = [hsx|
    <div class="About">
        <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-center">
          <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarTogglerDemo01">
              <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/home">Home</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/about">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/BlogPosts">Blog</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/contact" tabindex="-1" aria-disabled="true">Contact</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>

        <div class="AboutContentWrapper">
            <div class="AboutContent">
                <h1>About</h1>
                <div class="AboutParagraphWrapper">
                    <p class="AboutParagraph">
                    The idea behind <span>RikaRelief</span> is simple. It is driven by the question: <span>How does one solve relief problems using peers?</span> 
                    One answer is RikaRelief. We have, on one hand, people (peers) who have resources they can contribute to the network of peers. These resources may include 
                    capital, assets, time, skills, infrastructure and pretty much anything you can think of. Once available to the network these resources will then be used to solve specific 
                    relief problems that other peers have 'contributed' to the network. This brings us to the other side where in essence people (peers) have a deficit of resources, this could be 
                    a food shortage due to a drought, a housing shortage due to a flood and other disaster related problems. The role of the 'platform' is to provide ways 
                    in which the resources available can be used to fill the needs created.
                    </p>
                </div>
            </div>
        </div>
    </div>
    |]