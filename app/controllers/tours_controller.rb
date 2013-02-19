class ToursController < ApplicationController
  def show
    @tour = Category.find_using_slug(params[:sub_category]).tours.find_using_slug(params[:tour])
    @page_title = @tour.page_title
    @meta_content = @tour.meta_tag
    impressionist(@tour)
  end
  
  
end
