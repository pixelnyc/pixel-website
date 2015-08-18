namespace :redis do
  task :clear do
    on roles :all do
      execute 'redis-cli flushall'
    end
  end
end