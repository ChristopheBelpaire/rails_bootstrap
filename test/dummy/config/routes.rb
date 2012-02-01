Rails.application.routes.draw do

  mount RailsBootstrap::Engine => "/"
  resources :test

  root :to => 'test#index'
end
