if File.exists? "#{Rails.root}/config/twitter.yml"
  twitter_config = YAML::load(File.open("#{Rails.root}/config/twitter.yml"))[Rails.env]
  Twitter.configure do |config|
    config.consumer_key = twitter_config['consumer_key']
    config.consumer_secret = twitter_config['consumer_secret']
    config.oauth_token = twitter_config['oauth_token']
    config.oauth_token_secret = twitter_config['oauth_token_secret']
  end

end