class ContactUsController < ApplicationController
  def index
    @contact_us = ContactUs.new
    render :new
  end
  def new
     
  end
  
  def create
    logger.debug "**********************"
#    @hotel = Hotel.new(params[:hotel])
#    respond_to do |format|
#      if @hotel.save
#        flash[:notice] = 'Hotel was successfully created.'
#        format.html { redirect_to admin_hotels_path }
#        format.xml  { head :ok }
#      else
#        format.html { render :new }
#        format.xml  { render :xml => @hotel.errors, :status => :unprocessable_entity }
#      end
#    end 
  end
  
end