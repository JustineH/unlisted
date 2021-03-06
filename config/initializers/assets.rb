# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( registrations.css )
Rails.application.config.assets.precompile += %w( registrations.js )

%w(images listings users vendors welcome).each do |controller|
  Rails.application.config.assets.precompile += ["#{controller}.js", "#{controller}.css"]
end


# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
