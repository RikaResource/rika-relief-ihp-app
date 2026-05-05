module RikaRelief.Controller.MainApp where

import RikaRelief.Controller.Prelude

import RikaRelief.View.Static.Welcome

import RikaRelief.View.MainApp.Home
import RikaRelief.View.MainApp.ResourcePool
import RikaRelief.View.MainApp.Problems
import RikaRelief.View.MainApp.Settings

instance Controller MainAppController where
    action GoToHomeAction = 
        case currentUserOrNothing of 
            Nothing -> do render WelcomeView
            Just currentUser -> do render AppHomeView
    action ResourcePoolAction = 
        case currentUserOrNothing of 
            Nothing -> do render WelcomeView
            Just currentUser -> do render ResourcePoolView
    action ProblemsAction = do
        render ProblemsView
    action SettingsAction = do
        render SettingsView