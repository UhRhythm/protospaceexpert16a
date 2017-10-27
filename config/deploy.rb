# config valid only for current version of Capistrano
lock '3.10.0'

set :application, 'protospaceexpert16a'
set :repo_url,  'git@github.com:UhRhythm/protospaceexpert16a.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/nigaurikensuke/.ssh/key_pair_tokyo.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5
set :log_level, :debug
set :default_env, {
	rbenv_root: "/usr/local/var/rbenv",
	path: "~/.rbenv/shims:~/.rbenv/bin:$PATH",
	AWS_REGION: ENV['AWS_REGION'],
	AWS_ACCESS_KEY_ID: ENV["AWS_ACCESS_KEY_ID"],
    AWS_SECRET_ACCESS_KEY: ENV["AWS_SECRET_ACCESS_KEY"]
}
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
set :sidekiq_queue, :carrierwave
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end