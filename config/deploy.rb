
require 'bundler/capistrano'
set :application, "andesconexion"
load "lib/deployer/deployer.rb"
global_defaults 

set :repository,  "git@github.com:fabianraf/andesconexion.git"
set :scm, :git
set :user, "deployer"  # The server's user for deploys
ssh_options[:forward_agent] = true
set :branch, "master"
set :git_enable_submodules, 1

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

task :preview do
  set :rails_env, "preview"
  set :ruby_path, "/usr/local/ruby/bin"
  server "50.116.60.170", :app, :web, :db, :primary => true
  defaults
  set :default_environment, {'PATH'=> "/usr/local/ruby/bin:$PATH"}
  set :deploy_via, :remote_cache  
  set :apache_user, "www-data"
  set :apache_group, "dev"
  set :apache_dir, "/etc/apache2"
  set :apache_logs, "/var/log/apache2/#{application}-#{rails_env}"  
  set :apache_config, "/etc/apache2/sites-available"
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
end
