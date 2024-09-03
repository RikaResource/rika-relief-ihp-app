module RikaRelief.View.MainApp.Home where

import RikaRelief.View.Prelude

data AppHomeView = AppHomeView

instance View AppHomeView where 
    html AppHomeView = [hsx|
        <div class="app-content">
            <h2 class="welcome-header">Hello {currentUser.id}</h2>
            <a class="js-delete js-delete-no-confirm text-secondary home-logout-button" href={DeleteUserSessionAction}>Logout</a>
            <div class="resource-content-holder">
                <div class="rika-resource-menu">
                    <div class="rika-resource-main-menu-content">
                        <div class="resource-pool-menu-item">
                            <a href={ResourcePoolAction} style="display:block; width:100%; height:100%;"></a>
                            <h1 class="resource-pool-menu-title">ResourcePool</h1>
                            <img src="/resource-pool-icon-3.svg" alt="InfiDyn" class="resource-pool-menu-image" />
                        </div>
                        <div class="problems-menu-item">
                            <a href={ProblemsAction} style="display:block; width:100%; height:100%;"></a>
                            <h1 class="resource-pool-menu-title">Problems</h1>
                            <img src="/problem-icon.svg" alt="InfiDyn" class="resource-pool-menu-image" />
                        </div>
                        <div class="settings-menu-item">
                            <a href={SettingsAction} style="display:block; width:100%; height:100%;"></a>
                            <h1 class="resource-pool-menu-title">Settings</h1>
                            <img src="/settings-icon.svg" alt="InfiDyn" class="resource-pool-menu-image" />
                        </div>
                    </div>
                </div>
            </div>
            {footer}            
        </div>
    |]


-- renderResource :: Resource -> Html
-- renderResource resource = [hsx|
-- |]
-- <script src={assetPath "/rikaResource.js"}/>    