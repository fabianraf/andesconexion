class Admin::ToursController < Admin::BaseController
  def index
    @category = Category.find(params[:category_id])
    @tours = @category.tours.page(params[:page]).per(10)
  end
  def new
    @category = Category.find(params[:category_id])
    @tour = @category.tours.new
    @tour.build_main_tour_image
  end
  def show
    @tour = Category.find(params[:category_id]).tours.find(params[:id])
  end
  def create
    @category = Category.find(params[:category_id])
    @tour = @category.tours.new(params[:tour])
    respond_to do |format|
      if @tour.save
        flash[:notice] = 'tour was successfully created.'
        format.html { redirect_to admin_category_tours_path(@category) }
        format.xml  { head :ok }
      else
        @tour.build_main_tour_image
        format.html { render :new, :locals => {:tour => @tour} }
        format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @category = Category.find(params[:category_id])
    @tour = @category.tours.find(params[:id])
  end
  
  def update
    @tour = Category.find(params[:category_id]).tours.find(params[:id])
    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        flash[:notice] = 'tour was successfully updated.'
          format.html { redirect_to admin_category_tours_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @tour = Category.find(params[:category_id]).tours.find(params[:id])
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to admin_category_tours_path }
      format.xml  { head :ok }
    end
  end
  
end
