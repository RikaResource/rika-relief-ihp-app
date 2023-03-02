module Web.View.Static.Contact where
import Web.View.Prelude
-- import Application.Helper.View

data ContactView = ContactView

instance View ContactView where
    html ContactView = [hsx|

    <div class="Contact">
      {renderNavBar}
        <div class="ContactContentWrapper">
          <div class="ContactContent">
            <p class="ContactParagraph">You can contact us at the following email address: <span class="ContactEmail">rikaRelief@protonmail.com</span></p>
          </div>
        </div>

    </div>
    
    |]