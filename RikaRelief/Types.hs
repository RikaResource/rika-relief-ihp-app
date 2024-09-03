module RikaRelief.Types where

import IHP.Prelude
import IHP.ModelSupport
import IHP.LoginSupport.Types
import Generated.Types

data RikaReliefApplication = RikaReliefApplication deriving (Eq, Show)


data StaticController 
    = WelcomeAction 
    deriving (Eq, Show, Data)

data SessionsController
    = NewUserSessionAction
    | CreateUserSessionAction
    | DeleteUserSessionAction
    deriving (Eq, Show, Data)

data UsersController
    = NewUserAction
    | CreateUserAction
    -- | UsersAction
    deriving (Eq, Show, Data)

data MainAppController
    = GoToHomeAction
    | ResourcePoolAction
    | ProblemsAction
    | SettingsAction
    deriving (Eq, Show, Data)

instance HasNewSessionUrl User where
    newSessionUrl _ = "/NewSession"

type instance CurrentUserRecord = User