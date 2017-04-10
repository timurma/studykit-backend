lock '3.8.0'

set :application, 'studykit'
set :repo_url, 'git@github.com:timurma/studykit-backend.git'

# set :deploy_via,   :remote_cache
set :user,         'studykit'
set :deploy_to,    "/home/#{fetch(:user)}/#{fetch(:application)}"
set :linked_files, %w(.env)
set :linked_dirs,  %w(log tmp/pids tmp/cache tmp/sockets)

set :puma_threads,            [1, 8]
set :puma_workers,            0
set :puma_bind,               "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,              "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,                "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log,         "#{release_path}/log/puma_access.log"
set :puma_error_log,          "#{release_path}/log/puma_error.log"
set :puma_preload_app,        true
set :puma_worker_timeout,     nil
set :puma_init_active_record, true

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
