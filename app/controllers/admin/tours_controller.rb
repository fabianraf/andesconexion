class Admin::ToursController < Admin::BaseController
  def index
    if params[:last_minute] == "true"
      @tours = Tour.last_minute_offers.order("category_id asc").page(params[:page]).per(10)
    else
      @tours = Tour.not_last_minute_offers.order("category_id asc").page(params[:page]).per(10)
    end
    
  end
  def new
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @tour = @category.tours.new
    else
      @tour = Tour.new
    end
    @tour.build_main_tour_image
    @tour.tour_images.build
  end
  def show
    @tour = Category.find(params[:category_id]).tours.find(params[:id])
  end
  def create
    if params[:category_id].present?
      @category = Category.find(params[:category_id]) 
      @tour = @category.tours.new(params[:tour])
    else
      @tour = Tour.new(params[:tour])
    end
    respond_to do |format|
      if @tour.save
        flash[:notice] = 'tour was successfully created.'
        format.html { redirect_to admin_tours_path(@tour) }
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
    @tour.tour_images.build
  end
  
  def update
    @tour = Category.find(params[:category_id]).tours.find(params[:id])
    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        flash[:notice] = 'tour was successfully updated.'
          format.html { redirect_to show_tours_admin_category_path(Category.find(params[:category_id])) }
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
