class CategoriesController < ApplicationController
  impressionist
  def index
    
  end
  def show_info
    @category = Category.find(params[:main_category])
  end
end
