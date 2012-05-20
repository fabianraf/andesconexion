class ToursController < ApplicationController
  impressionist
  def show
    @tour = Category.find(params[:sub_category]).tours.find(params[:tour])
  end
  
  
end
