module RikaRelief.View.MainApp.Problems where

import RikaRelief.View.Prelude

data ProblemsView = ProblemsView

instance View ProblemsView where 
    html ProblemsView = [hsx|
        <div class="app-content">
            <h2>Hello {currentUser.id}</h2>
            <a class="js-delete js-delete-no-confirm text-secondary" href={DeleteUserSessionAction}>Logout</a>
            <div class="resource-content-holder">
                <div class="resource-canvas" id="resource-pool">
                    <p>Hello there problems</p>
                    
                </div>
            </div>
            {footer}            
        </div>
    |]


-- renderResource :: Resource -> Html
-- renderResource resource = [hsx|
-- |]
-- <script src={assetPath "/rikaResource.js"}/>    