module Web.FrontController where

import IHP.RouterPrelude
import Web.Controller.Prelude
import Web.View.Layout (defaultLayout)

-- Controller Imports
import Web.Controller.Comments
import Web.Controller.BlogPosts
import Web.Controller.Static

instance FrontController WebApplication where
    controllers = 
        [ startPage WelcomeAction
        , parseRoute @StaticController
        -- Generator Marker
        , parseRoute @CommentsController
        , parseRoute @BlogPostsController
        ]

instance InitControllerContext WebApplication where
    initContext = do
        currentTime <- getCurrentTime
        setLayout defaultLayout
        initAutoRefresh
