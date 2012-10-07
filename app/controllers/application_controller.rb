class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  #filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user 
  prepend_before_filter :show_some_last_minute_offers, :load_standalone_pages, :load_banners
  
  def show_some_last_minute_offers
    @last_minute_offers = LastMinuteOffer.limit(2).order("sort_order asc")
    @categories = Category.where("parent_id is null").order("sort_order asc")
  end
  
  def load_standalone_pages
    @standalone_pages = StandalonePage.is_active
  end
  
  def load_banners
    @banners = Banner.active.order("RANDOM()").limit(2)
  end
  
  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end
  
  def require_user
     unless current_user
       store_location
       flash[:notice] = "You must be logged in to access this page"
       redirect_to new_user_session_url
       return false
     end
   end
   
   def require_no_user
     if current_user
       store_location
       flash[:notice] = "You must be logged out to access this page"
       redirect_to account_url
       return false
     end
   end

   def store_location
     session[:return_to] = request.path
   end

   def redirect_back_or_default(default)
     redirect_to(session[:return_to] || default)
     session[:return_to] = nil
   end
end
