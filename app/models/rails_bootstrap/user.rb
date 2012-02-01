module RailsBootstrap
  class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable, :omniauthable

    # Setup accessible (or protected) attributes for your model
    attr_accessible :email, :password, :password_confirmation, :remember_me, :is_admin

    has_many :authentifications

    def self.find_for_facebook_oauth(data, signed_in_resource=nil)
      user = Authentification.find_by_identification(data["uid"]).user rescue nil
      return user
    end

    def self.find_for_twitter_oauth(data, signed_in_resource=nil)
      user = Authentification.find_by_identification(data["uid"]).user rescue nil
      return user
    end

    def add_authentifictation(strategy, identification, username )
      self.authentifications.find_or_create_by_strategy_and_identification_and_username(strategy, identification, username)
    end

  end
end