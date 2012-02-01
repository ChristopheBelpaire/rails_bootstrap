module RailsBootstrap
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def passthru
      render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
    end

    def facebook
      id = env["omniauth.auth"]["uid"]
      username =  env["omniauth.auth"]['extra']['nickname']
      session['facebook_access_token'] = env["omniauth.auth"]['credentials']['token']
      current_user.add_authentifictation("facebook", id, username ) and redirect_to env["omniauth.origin"] and return if current_user

      @user = User.find_for_facebook_oauth(env["omniauth.auth"], current_user)
      if env["omniauth.origin"].match /sign_/
        if @user
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
          sign_in :user, @user
          redirect_to :back and return
        else
          session["omniauth"]={}
          session["omniauth"]['authentifications_attributes']=[]
          session["omniauth"]['authentifications_attributes'][0]={}
          session["omniauth"]['authentifications_attributes'][0]['strategy'] = 'facebook'
          session["omniauth"]['authentifications_attributes'][0]['identification'] = id
          session["omniauth"]['authentifications_attributes'][0]['username'] = username
          session["omniauth"]['username'] = username
          redirect_to new_user_registration_url
        end
      else
        redirect_to env["omniauth.origin"]
      end
    end

    def twitter
      id = env["omniauth.auth"]["uid"]
      username =  env["omniauth.auth"]["info"]["nickname"]
      session['twitter_access_token'] = env["omniauth.auth"]['credentials']['token']
      session['twitter_access_secret'] = env["omniauth.auth"]['credentials']['secret']

      current_user.add_authentifictation("twitter", id, username ) and redirect_to env["omniauth.origin"] and return if current_user

      @user = User.find_for_twitter_oauth(env["omniauth.auth"], current_user)
      if env["omniauth.origin"].match /sign_/
        if @user
          flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
          sign_in :user, @user
          redirect_to :back and return
        else
          session["omniauth"]={}
          session["omniauth"]['authentifications_attributes']=[]
          session["omniauth"]['authentifications_attributes'][0]={}
          session["omniauth"]['authentifications_attributes'][0]['strategy'] = 'twitter'
          session["omniauth"]['authentifications_attributes'][0]['identification'] = env["omniauth.auth"]["user_info"]["nickname"]
          session["omniauth"]['authentifications_attributes'][0]['username'] = env["omniauth.auth"]["user_info"]["nickname"]
          session["omniauth"]['username'] = env["omniauth.auth"]["user_info"]["nickname"]
          redirect_to new_user_registration_url
        end
      else
        redirect_to env["omniauth.origin"]
      end
    end
  end
end