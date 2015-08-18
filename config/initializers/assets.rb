Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( frontend.js frontend.css
                                                  backend.js backend.css )

Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/

Rails.application.assets.register_engine('.slim', Slim::Template)
