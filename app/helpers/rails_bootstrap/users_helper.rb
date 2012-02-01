module RailsBootstrap
  module UsersHelper
    def post_to_facebook message
      @action = 'post_to_facebook'
      @message = message
      render :partial => 'rails_bootstrap/users/post'
    end

    def post_to_twitter message
      @action = 'post_to_twitter'
      @message = message
      render :partial => 'rails_bootstrap/users/post'
    end
  end
end
