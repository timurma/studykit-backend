namespace :deploy do
  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before :restart, 'puma:start'
      invoke :deploy
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, :cleanup
  after :finishing, :restart
end
