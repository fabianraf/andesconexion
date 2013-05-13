class Admin::UsersController < Admin::BaseController
  def edit
    @user = current_user
  end
end