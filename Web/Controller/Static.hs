module Web.Controller.Static where
import Web.Controller.Prelude
import Web.View.Static.Welcome
import Web.View.Static.About
import Web.View.Static.Contact

instance Controller StaticController where
    action WelcomeAction = render WelcomeView
    action AboutAction   = render AboutView
    action ContactAction = render ContactView
