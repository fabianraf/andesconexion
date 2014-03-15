class HotelsController < ApplicationController
  
  def index
    @page_title = "AndesConexion | Hotels"
    @hotels = Hotel.all  
  end
  
  def show
    @hotel = Hotel.find(params[:id])
    @page_title = @hotel.name
  end
  
end
