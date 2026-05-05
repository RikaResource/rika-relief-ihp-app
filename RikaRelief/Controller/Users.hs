module RikaRelief.Controller.Users where

import IHP.ValidationSupport.Types
import Data.Text

import RikaRelief.Controller.Prelude hiding (length)
import RikaRelief.View.Users.New


instance Controller UsersController where
    action NewUserAction = do
        let user = newRecord
        render NewView { .. }
    action CreateUserAction = do
        let user = newRecord @User
        user
            |> buildUser
            |> validateField #passwordHash nonEmpty
            |> validateField #passwordHash (hasMinLength 8)
            |> validateField #repeatPasswordHash nonEmpty
            |> \user -> validateField #repeatPasswordHash (matchesHash user.passwordHash) user
            |> validateField #email isEmail
            |> validateField #email nonEmpty
            |> validateIsUnique #email
            >>= ifValid \case
                Left user  -> render NewView { user = user }
                Right user -> do
                    hashed <- hashPassword user.passwordHash
                    repeathashed <- hashPassword user.repeatPasswordHash
                    user <- user
                        |> set #passwordHash hashed
                        |> set #repeatPasswordHash repeathashed
                        |> createRecord
                    setSuccessMessage "You have registered successfully"
                    redirectToPath "/rikarelief/"


buildUser user = user
    |> fill @["email","passwordHash","repeatPasswordHash"]


matchesHash :: Text -> Text -> ValidatorResult
matchesHash reppass pass = if pass == reppass then Success else Failure "Does not match the password"
{-# INLINABLE matchesHash #-}

isComplex :: Text -> ValidatorResult
isComplex pass = if length pass >= 8 then Success else Failure "Password too weak"