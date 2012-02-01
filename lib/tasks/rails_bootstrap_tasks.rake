# desc "Explaining what the task does"
# task :rails_bootstrap do
#   # Task goes here
# end
task :routes => 'app:environment' do
  Rails.application.reload_routes!
  all_routes = RailsBootstrap::Engine.routes.routes
end