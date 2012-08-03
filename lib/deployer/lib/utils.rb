#
#
#
#  Utility functions:
#
#  Designed to be used within Capsitrano tasks
#
#

#
# Confirm that the user knows they are deploying to production
#
def confirm_production
	puts "\n\e[0;31m   ######################################################################"
	puts "   #\n   #       Are you REALLY sure you want to deploy to production?"
	puts "   #\n   #               Enter y/N + enter to continue\n   #"
	puts "   ######################################################################\e[0m\n"
	proceed = STDIN.gets[0..0] rescue nil
	exit unless proceed == 'y' || proceed == 'Y'
end

#
#  Setup default variables here:
#  -- to be reused in tasks and functions
#
def defaults 
  default_run_options[:pty] = true
	set :deploy_to, "/usr/local/www/#{application}-#{rails_env}"
	set :apache_config_file,  "#{application}-#{rails_env}.conf"
	set :apache_logs, "/var/log/apache2/#{application}-#{rails_env}"
  set :files_dir, "#{deploy_to}/files"

  # Environment specific tasks
  case rails_env
    when "staging"
      after "deploy:symlink", "deploy:cleanup" # cleanup older versions if successful
    when "preview"
      # nothing yet
    when "production"
      # nothing yet
  end
end

def global_defaults
	set :ruby_path, "/usr/local/ruby/bin"
	set :apache_user, "www-data"
	set :apache_group, "dev"
	set :apache_dir, "/etc/apache2"
	set :apache_init, "/etc/init.d/apache2"
	set :apache_config, "/etc/apache2/sites-available"
end

def set_file_permissions(path)
		run "
			#{sudo} chown -R #{apache_user}:dev #{path} && \
			#{sudo} chmod -R g+rw #{path}
		"
end

#
#
#  Timer methods
#
#
def start_time
	@start_time = Time.now
end

def end_time
	@end_time = Time.now
end

def total_time
	(@end_time - @start_time).round
end
