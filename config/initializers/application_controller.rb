if not defined?(ApplicationController)
  class ApplicationController < ActionController::Base
    def authenticate_admin_user!
      authenticate_user!
      redirect_to :new_user_session unless current_user && current_user.is_admin
    end

    def current_admin_user
      return current_user if current_user && current_user.is_admin
      return nil
    end
  end
end