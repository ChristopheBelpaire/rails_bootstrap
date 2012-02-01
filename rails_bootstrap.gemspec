$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_bootstrap/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_bootstrap"
  s.version     = RailsBootstrap::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of RailsBootstrap."
  s.description = "TODO: Description of RailsBootstrap."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.0"
  s.add_dependency "activeadmin"
  s.add_dependency "meta_search",    '>= 1.1.0.pre'
#  s.add_dependency 'sass-rails', "~> 3.1.0"

  s.add_dependency "devise", "~> 2.0.0"
  s.add_dependency "omniauth"
  s.add_dependency "omniauth-facebook"
  s.add_dependency "omniauth-twitter"

  s.add_dependency "koala"
  s.add_dependency "twitter"
  # s.add_dependency "jquery-rails"

  s.add_development_dependency "sqlite3"
end
