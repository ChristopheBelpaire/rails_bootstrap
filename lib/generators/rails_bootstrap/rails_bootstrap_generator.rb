class RailsBootstrapGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def install
    copy_file "twitter.yml", "#{Rails.application.root}/config/twitter.yml"
    copy_file "facebook.yml", "#{Rails.application.root}/config/facebook.yml"
  end
end
