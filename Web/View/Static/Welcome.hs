module Web.View.Static.Welcome where
import Web.View.Prelude
-- import Application.Helper.View

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|
    <div class="Landing" >
      {renderNavBar}
        <div class="LandingLogo">
          <div class="LandingImageWrapper">
            <img class="LogoImage" src="./rika-light-logo.svg">
          </div>

            <div class="LogoTextWrapper">
                <h1 class="LogoText">
                    RikaRelief
                </h1>
            </div>
        </div>
        

        <div class="LandingContent">
            <div class="LandingMain">
                <h2 class="MainLandingText">
                    A Peer Resource Network.
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

-- <button class="AppButton btn btn-secondary" onclick="window.open('/rikarelief/');">
--                         RikaRelief
--                     </button>
