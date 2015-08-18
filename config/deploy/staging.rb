set :branch, 'master'
set :rails_env, 'staging'
set :unicorn_env, 'staging'
set :deploy_to, "/home/demo/apps/#{fetch(:application)}/#{fetch(:rails_env)}"

server 'chicago', user: 'demo', roles: %w[app web db]