# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'pixel-website'
set :rails_env, :staging
set :repo_url, 'git@gitlab.risearrow.com:root/pixel-website.git'

set :linked_files, %w{config/database.yml config/secrets.yml }
set :linked_dirs, %w{bin log tmp/pids public/assets tmp/cache tmp/sockets vendor/bundle public/uploads }

set :keep_releases, 5
set :ssh_options, { forward_agent: true }

set :rbenv_ruby, '2.2.1'

task :seed_data do
  on roles :all do
    within release_path do
      with rails_env: fetch(:rails_env) do
        execute :rake, 'seed:migrate'
      end
    end
  end
end

after 'deploy:finished', 'seed_data'
after 'deploy:publishing', 'app:restart'