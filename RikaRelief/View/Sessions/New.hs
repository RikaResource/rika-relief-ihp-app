module RikaRelief.View.Sessions.New where

import RikaRelief.View.Prelude
import IHP.AuthSupport.View.Sessions.New

instance View (NewView User) where
    html NewView { .. } = [hsx|
        <div class="h-100" id="sessions-new">
            <div class="d-flex align-items-center">
                <div class="w-100">
                    <div style="max-width: 400px" class="mx-auto mb-5">
                        <h5>Please Login</h5>
                        {renderForm user}
                    </div>
                </div>
            </div>
        </div>
    |]


renderForm :: User -> Html
renderForm user = [hsx|
    <form method="POST" action={CreateUserSessionAction}>
        <div class="form-group">
            <input name="email" value={user.email} type="email" class="form-control" placeholder="E-Mail" required="required" autofocus="autofocus" />
        </div>
        <div class="form-group">
            <input name="password" type="password" class="form-control" placeholder="Password"/>
        </div>
        <button type="submit" class="btn btn-primary btn-block login-button">Login</button>
        <a href={NewUserAction}>Register Instead?</a>
    </form>
|]