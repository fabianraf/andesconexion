class ContactUsController < ApplicationController
  def index
    render :new
  end
  def new
     @contact_us = ContactUs.new
  end
  
end