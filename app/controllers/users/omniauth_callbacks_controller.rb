class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
     @user = User.from_omniauth(request.env["omniauth.auth"])
     if @user.errors.empty?
            sign_in_and_redirect @user
        else
            render "/devise/registrations/new"
        end     
  end

  def google_oauth2
    @user = User.from_omniauth(request.env["omniauth.auth"])
    if @user.errors.empty?
            sign_in_and_redirect @user
        else
            render "/devise/registrations/new"
        end
  end

end