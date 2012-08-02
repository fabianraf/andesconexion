
#
#  Tasks to perform while performing setup
#  for a new environment
#
namespace :setup do

	#
	#  Perform the create database rake task
	#
	desc "Create a new database for this RAILS_ENV"
	task :create_database, :roles => :db do
		#run "cd #{current_path}; #{ruby_path}/rake RAILS_ENV=#{rails_env} db:create"
    run "cd #{current_path}; bundle exec rake RAILS_ENV=#{rails_env} db:create"
	end

	#
	#  Create log directories for the environment
	#
	desc "Create Apache Log Directory"
	task :create_apache_logs_dir do
		run "#{sudo} mkdir -p #{apache_logs}"
		run "#{sudo} chown -R #{apache_user}:dev #{apache_logs}"
	end

	#
	#  Checkout the files repository:  
	#
	#  contains:
	#  		plugins/
	#  		rails-x-x-x/
	#
	desc "Check out the files dir:  plugins and Rails"
	task :checkout_files_dir do
		input = ''
		set(:user) { Capistrano::CLI.ui.ask("#{scm} user name: ") }
		run "#{sudo} svn co #{files_repository} --username=#{user} #{deploy_to}/files" do |ch,stream,out|
			next if out.chomp == input.chomp || out.chomp == ''
			print out
			ch.send_data(input = $stdin.gets) if out =~ /accept/i
		end
	end

	#
	#  Set permissions on files:
	# 
	#  Should give the application and the "dev" group
	#  permissions to read and write files
	#
	desc "Set permissions on the newly checked out files"
	task :set_permissions do
		run "#{sudo} chown -R #{apache_user}:dev #{deploy_to}"
		run "#{sudo} chmod -R g+rw #{deploy_to}"
	end

	#
	#  Enable the new environment in the host's Apache configuration
	#
	desc "Create link to sites-available configuration"
	task :set_sites_available_link do 
		if File.exists? "#{apache_dir}/sites-enabled"
		  run "#{sudo} ln -s #{apache_config}/#{apache_config_file} #{apache_dir}/sites-enabled"
		end
	end

end

