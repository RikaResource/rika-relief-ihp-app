module RikaRelief.View.Users.New where

import RikaRelief.View.Prelude


data NewView = NewView { user :: User }

instance View NewView where
    html NewView { .. } = [hsx|
        <div class="h-100" id="sessions-new">
            <div class="d-flex align-items-center">
                <div class="w-100">
                    <div style="max-width: 400px" class="mx-auto mb-5">
                        <h5>Create User Account</h5>
                        {renderForm user}
                    </div>
                </div>
            </div>
        </div>
    |]


renderForm :: User -> Html
renderForm user = formFor user [hsx|
    {(emailField #email) {fieldLabel = "E-Mail", placeholder = "JaneDoe@gmail.com", required = True}}
    {(passwordField #passwordHash){fieldLabel = "Password", placeholder = "Password", required = True}}
    {(passwordField #repeatPasswordHash){fieldLabel = "Repeat Password", placeholder = "Repeat Password", required = True}}
    <div class="flex items-center justify-between">
        <button type="submit" class="btn btn-primary btn-block sign-up-button">Signup</button>
        <a href={NewUserSessionAction}>Login Instead?</a>
    </div>
|]