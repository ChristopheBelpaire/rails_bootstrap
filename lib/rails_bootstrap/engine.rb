require 'active_admin'
require 'omniauth-facebook'
require 'omniauth-twitter'
require 'koala'
require 'twitter'

module RailsBootstrap
  #include ActiveAdmin::Admin
  class Engine < Rails::Engine
    isolate_namespace RailsBootstrap
  #  paths["app/views"] << "/app/views/active_admin"
  end
end
