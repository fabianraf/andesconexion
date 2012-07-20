class Admin::BaseController < ApplicationController
  #layout 'admin'
  before_filter :authenticate_user!, :except => [:exception_test]
  protect_from_forgery
  layout :layout_by_resource
  before_filter :load_defaults
  #Admins::SessionsController < Devise::SessionsController
  def load_defaults
    @top_categories = Category.without_parents.order("sort_order asc")
  end
  
  protected
  
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || "/admin"
  end
  
  def layout_by_resource
    unless devise_controller?
      "admin"
    end
  end
end