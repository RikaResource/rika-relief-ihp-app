{-# LANGUAGE OverloadedStrings #-}

module RikaRelief.Controller.Static where
import RikaRelief.Controller.Prelude
import RikaRelief.View.Static.Welcome
import RikaRelief.View.Sessions.New 
import IHP.AuthSupport.View.Sessions.New
import IHP.IDE.SchemaDesigner.View.Migrations.New hiding (NewView(..), render)

instance Controller StaticController where
    action WelcomeAction = 
        case currentUserOrNothing of 
            Just user -> redirectTo GoToHomeAction
            Nothing   -> redirectTo NewUserSessionAction