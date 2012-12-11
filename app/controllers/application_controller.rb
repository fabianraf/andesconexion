class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  #filter_parameter_logging :password, :password_confirmation
  prepend_before_filter :show_some_last_minute_offers, :load_standalone_pages, :load_banners
  
  def show_some_last_minute_offers
    @last_minute_offers = Tour.last_minute_offers.limit(2).order("RANDOM()")
    @categories = Category.where("parent_id is null").order("sort_order asc")
  end
  
  def load_standalone_pages
    @standalone_pages = StandalonePage.is_active
  end
  
  def load_banners
    @banners = Tour.last_minute_offers.limit(2).order("RANDOM()")
  end
  
  
end
