class ToursController < ApplicationController
  def show
    @tour = Category.find(params[:sub_category]).tours.find(params[:tour])
    impressionist(@tour)
  end
  
  
end
