namespace :app do
  desc 'Start application'
  task :start do
    invoke 'unicorn:start'
  end

  desc 'Stop application'
  task :stop do
    invoke 'unicorn:stop'
  end

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end