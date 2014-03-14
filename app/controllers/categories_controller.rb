class CategoriesController < ApplicationController
  #impressionist
  def index
    
  end
  def show_info
    @category = Category.find_by_cached_slug params[:main_category]
    @page_title = @category.page_title
    @meta_content = @category.meta_tag
  end
  def show_info_sub_category
    p "---------"
    p params.inspect
    @category = Category.find_by_cached_slug params[:sub_category]
    @parent_category = Category.find_by_cached_slug params[:main_category]
    @page_title = @category.page_title
    @meta_content = @category.meta_tag
  end
end
