RailsBootstrap::Engine.routes.draw do
  devise_for :users, {
    :class_name => 'RailsBootstrap::User',
    :module => :devise,
    :controllers => {:omniauth_callbacks => "rails_bootstrap/omniauth_callbacks" }
  }

  ActiveAdmin.routes(self)

  match "post_to_facebook" => "users#post_to_facebook", :as => :post_to_facebook
  match "post_to_twitter" => "users#post_to_twitter", :as => :post_to_twitter

end

