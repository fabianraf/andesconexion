namespace :load_defaults do
  desc 'Load Default Admin'
  task(:load_default_admin => :environment) do
    admin = User.find_or_create_by_login( :login => 'admin', :email => 'admin@andesconexion.com', :password => 'test123', :password_confirmation => 'test123' )
    admin.save
    p "Username is #{admin.login} and password is 'test123'"
  end

end