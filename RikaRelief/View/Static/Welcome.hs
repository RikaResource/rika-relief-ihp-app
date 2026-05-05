module RikaRelief.View.Static.Welcome where
import           RikaRelief.View.Prelude
import           RikaRelief.Controller.Prelude

import           IHP.Controller.Redirect
import qualified IHP.RouterPrelude            as Router
import           RikaRelief.View.MainApp.Home (AppHomeView(AppHomeView))

data WelcomeView = WelcomeView

instance View WelcomeView where
    html WelcomeView = [hsx|

        {navbar}
        <footer class="footerclass">
            <a href="https://infidyn.org" target="_blank" rel="noopener noreferrer">
                Powered by
                <img src="/symbollogo.svg" alt="InfiDyn" class="footerlogo" />
            </a>
        </footer>
|]


-- Having an image as a logout button 
-- <a
--     href="{DeleteSessionAction}"
--     class="js-delete js-delete-no-confirm"
--     style="background:url(/logout.svg) left center no-repeat;width:40px"
-- ></a>

-- Making a dynamic Login/Logout button

navbar :: Html
navbar = [hsx|
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/rikarelief/">RikaRelief</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            {loginLogoutButton}
        </div>
        </nav>
|]
    where
        loginLogoutButton :: Html
        loginLogoutButton =
            case fromFrozenContext @(Maybe User) of
                Just user -> [hsx|<a class="js-delete js-delete-no-confirm text-secondary" href={DeleteUserSessionAction}>Logout</a>|]
                Nothing -> [hsx|<a class="text-secondary" href={NewUserSessionAction}>Login</a>|]


-- welcomeContent :: Html 
-- welcomeContent = [hsx|
--     <div class="welcome-app-content">
--         {registerOptions}
--     </div>
-- |]

--     where 
--         registerOptions :: Html
--         registerOptions = 
--             case fromFrozenContext @(Maybe User) of
--                 Just user -> renderView AppHomeView
--                 Nothing -> redirectTo NewUserAction

-- <a href={NewUserSessionAction}>Login</a>
-- <a href={NewUserAction}>Register</a>