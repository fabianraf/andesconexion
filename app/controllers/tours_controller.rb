class ToursController < ApplicationController
  def show
    @tour = Category.find_by_cached_slug(params[:sub_category]).tours.find_by_cached_slug(params[:tour])
    @page_title = @tour.page_title
    @meta_content = @tour.meta_tag
    @category = @tour.category.parent
#    impressionist(@tour)
  end
  
  
end
