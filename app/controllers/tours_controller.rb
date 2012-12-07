class ToursController < ApplicationController
  def show
    @tour = Category.find(params[:sub_category]).tours.find(params[:tour])
    @page_title = @tour.page_title
    @meta_content = @tour.meta_tag
    impressionist(@tour)
  end
  
  
end
