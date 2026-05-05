module RikaRelief.View.MainApp.Settings where

import RikaRelief.View.Prelude

data SettingsView = SettingsView

instance View SettingsView where 
    html SettingsView = [hsx|
        <div class="app-content">
            <h2>Hello {currentUser.id}</h2>
            <a class="js-delete js-delete-no-confirm text-secondary" href={DeleteUserSessionAction}>Logout</a>
            <div class="resource-content-holder">
                <div class="resource-canvas" id="resource-pool">
                    <p>Hello there settings</p>
                    
                </div>
            </div>
            {footer}            
        </div>
    |]


-- renderResource :: Resource -> Html
-- renderResource resource = [hsx|
-- |]
-- <script src={assetPath "/rikaResource.js"}/>    