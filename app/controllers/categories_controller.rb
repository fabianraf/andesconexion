class CategoriesController < ApplicationController
  #impressionist
  def index
    
  end
  def show_info
    @category = Category.find(params[:main_category])
    @page_title = @category.page_title
  end
  def show_info_sub_category
    @category = Category.find(params[:sub_category])
    @page_title = @category.page_title
  end
end
