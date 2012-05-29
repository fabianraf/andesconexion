class Admin::CategoriesController < Admin::BaseController
   def index
    @categories = Category.without_parents.page(params[:page]).per(10).order("sort_order asc")
  end
  def new
    @category = Category.new
    @category.build_middle_homepage_image
    @category.build_category_image
  end
  def show
    @category = Category.find(params[:id])
  end
  def sub_categories
    @category = Category.find(params[:id])
  end
  def create
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        flash[:notice] = 'category was successfully created.'
        format.html { redirect_to admin_categories_path }
        format.xml  { head :ok }
      else
        @category.build_middle_homepage_image
        @category.build_category_image
        format.html { render :new, :locals => {:category => @category} }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = 'category was successfully updated.'
          format.html { redirect_to admin_categories_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    respond_to do |format|
      format.html { redirect_to admin_categories_path }
      format.xml  { head :ok }
    end
  end
  
  def update_status
	  category = Category.find(params[:id])
	  category.status = params[:status]
	  if category.save
		  flash[:notice] = "Category status saved."
	  else
		  flash[:error] = category.errors
	  end
	  redirect_to :back
  end
  
  def update_order
		begin
      logger.debug "******"
      logger.debug params.inspect
      old_order = Category.select(:sort_order).order("sort_order asc")
      logger.debug old_order.inspect
      #params[:order] = ["1", "2", "3", "4", "5", "6"]
      Category.order = params[:order]
      render :json => {
				:status => true
			}
			return
		rescue Exception => errno
			render :json => {
				:status => false,
				:error_message => "There was an error saving the new order.  Please try again later. #{errno}"
			}
			return
		end
  end
end