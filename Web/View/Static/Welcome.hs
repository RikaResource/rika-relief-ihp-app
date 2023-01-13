module Web.View.Static.Welcome where
import Web.View.Prelude

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
    <div class="Landing" >
        <nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-center">
          <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01" aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarTogglerDemo01">
              <ul class="navbar-nav mb-2 mb-lg-0">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="#">About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">Blog</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" tabindex="-1" aria-disabled="true">Contact</a>
                </li>
              </ul>
            </div>
          </div>
        </nav>

        <div class="LandingLogo">
            <img class="LogoImage" src="./rika-light-icon.svg">
            <img>

            <div class="LogoTextWrapper">
                <h1 class="LogoText">
                    RikaRelief
                </h1>
            </div>
        </div>
        

        <div class="LandingContent">
            <div class="LandingMain">
                <h2 class="MainLandingText">
                    A friend to those in need.
                </h2>
            </div>

            <div class="InviteWrapper">
                <h3 class="MainLandingSubText">
                    Join Us!
                </h3>
                <div class="ParticipateForm">
                    <button class="ParticipateButton btn btn-secondary" onclick="window.open('https://github.com/RikaRelief');">
                        Participate
                    </button>
                </div>
            </div>
            
        </div>
              
    </div> 
         
|]


-- elements to add 
-- <button class="ThemeToggle" onclick="">
--             Switch to Theme
--         </button>
