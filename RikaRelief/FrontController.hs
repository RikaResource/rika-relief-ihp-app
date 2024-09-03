module RikaRelief.FrontController where

import IHP.RouterPrelude
import IHP.LoginSupport.Middleware
import RikaRelief.Controller.Prelude
import RikaRelief.View.Layout (defaultLayout)

-- Controller Imports
import RikaRelief.Controller.Static
import RikaRelief.Controller.Sessions
import RikaRelief.Controller.Users
import RikaRelief.Controller.MainApp

instance FrontController RikaReliefApplication where
    controllers = 
        [ startPage WelcomeAction
        , parseRoute @SessionsController
        , parseRoute @UsersController
        , parseRoute @MainAppController
        -- Generator Marker
        ]

instance InitControllerContext RikaReliefApplication where
    initContext = do
        currentTime <- getCurrentTime
        setLayout defaultLayout
        initAutoRefresh
        initAuthentication @User
