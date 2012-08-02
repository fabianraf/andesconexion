# include files
load File.join(File.dirname(__FILE__), "lib", "utils.rb")
load File.join(File.dirname(__FILE__), "tasks", "setup.rb")
load File.join(File.dirname(__FILE__), "tasks", "deploy.rb")

#
#  TODO: Check for deployer version
#
DEPLOYER_VERSION = 0

#
#  Show deploy times
#
before :deploy, "deploy:start_timer"
after :deploy, "deploy:end_timer"


#
#  Each new environment setup
#
after "deploy:setup", "setup:create_apache_logs_dir"
# after "deploy:setup", "setup:checkout_files_dir"
after "deploy:setup", "setup:set_permissions"

#
#  After first checkout
#
after "deploy:cold", "setup:create_database"
after "deploy:cold", "setup:set_sites_enabled_link"

#
#  Each deployment
#
before "deploy:symlink", "deploy:set_vendor_links"
#before "deploy:symlink", "deploy:update_files_dir"
before "deploy:symlink", "deploy:set_permissions"

after "deploy:symlink", "deploy:set_apache_link"

