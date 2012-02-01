module RailsBootstrap
  class UsersController < ApplicationController

    def post_to_facebook
       session["MESSAGE"] = params[:message]
       session["REDIRECT_AFTER"] = env["HTTP_REFERER"] unless session["REDIRECT_AFTER"]
       redirect_to omniauth_authorize_path('user', 'facebook', :origin => '/post_to_facebook') and return unless session['facebook_access_token']
       redirect = session["REDIRECT_AFTER"]
       @graph = Koala::Facebook::API.new(session['facebook_access_token'])
       @graph.put_wall_post(session["MESSAGE"])
       session["REDIRECT_AFTER"] = nil
       session["MESSAGE"] = nil
       redirect_to redirect, :flash =>{ :notices => 'You posted about this film' }
    rescue Koala::Facebook::APIError => e
      redirect_to omniauth_authorize_path('user', 'facebook', :origin => '/post_to_facebook') and return if e.message.match /Error validating access token.*/
      redirect_to redirect, :flash =>{ :errors => 'You already shared this on facebook' } if e.message == "OAuthException: (#506) Duplicate status message"
    end

    def post_to_twitter
       session["MESSAGE"] = params[:message]
       session["REDIRECT_AFTER"] = env["HTTP_REFERER"] unless session["REDIRECT_AFTER"]
       redirect_to omniauth_authorize_path('user', 'twitter', :origin => '/post_to_twitter') and return unless session['twitter_access_token']
       redirect = session["REDIRECT_AFTER"]
       @twitter = Twitter::Client.new(:oauth_token => session['twitter_access_token'], :oauth_token_secret => session['twitter_access_secret'])

       @twitter.update(session["MESSAGE"])
       session["REDIRECT_AFTER"] = nil
       session["MESSAGE"] = nil
       redirect_to redirect, :flash =>{ :notices => 'You tweeted about this film' }
    rescue Twitter::Error::Unauthorized => e
      redirect_to omniauth_authorize_path('user', 'twitter', :origin => '/post_to_twitter') and return
    rescue Twitter::Error::Forbidden => e
      redirect_to redirect, :flash =>{ :errors => 'You already tweeted the same message' }
    end
  end
end
