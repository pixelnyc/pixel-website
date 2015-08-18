set :branch, 'master'
set :rails_env, 'production'
set :unicorn_env, 'production'
set :deploy_to, "/home/ubuntu/apps/#{fetch(:application)}/#{fetch(:rails_env)}"

server 'pixel.demostage.me', user: 'ubuntu', roles: %w[app web db]

set :ssh_options, {
  keys: %w(~/.ssh/aws-pixel.pem),
  forward_agent: true
}