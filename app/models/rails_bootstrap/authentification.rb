module RailsBootstrap
  class Authentification < ActiveRecord::Base
    belongs_to :user
  end
end