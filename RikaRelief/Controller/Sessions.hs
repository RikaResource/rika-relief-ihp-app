module RikaRelief.Controller.Sessions where

import RikaRelief.Controller.Prelude
import RikaRelief.View.Sessions.New
-- import IHP.IDE.SchemaDesigner.View.Migrations.New hiding (NewView(..))
import qualified IHP.AuthSupport.Controller.Sessions as Sessions


instance Controller SessionsController where
    action NewUserSessionAction    = Sessions.newSessionAction @User
    action CreateUserSessionAction = Sessions.createSessionAction @User
    action DeleteUserSessionAction = Sessions.deleteSessionAction @User


instance Sessions.SessionsControllerConfig User where
    afterLoginRedirectPath  = "/rikarelief/"
    afterLogoutRedirectPath = "/rikarelief/"
    -- beforeLogin = updateLoginHistory 

updateLoginHistory user = do
    user
        |> modify #logins (+ 1)
        |> updateRecord
    pure ()