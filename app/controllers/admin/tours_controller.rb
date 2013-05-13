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
    @tour = Tour.find_using_slug(params[:id])
  end
  def create
    if params[:category_id].present?
      @category = Category.find(params[:category_id]) 
      @tour = @category.tours.new(params[:tour])
    else
      @tour = Tour.new(params[:tour])
    end
    @tour.created_by_id = current_user.id
    @tour.last_updated_by_id = current_user.id
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
    @tour = Tour.find_using_slug(params[:id])
    @tour.tour_images.build
  end
  
  def update
    @tour = Tour.find_using_slug(params[:id])
    @tour.last_updated_by_id = current_user.id
    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        flash[:notice] = 'tour was successfully updated.'
          format.html { redirect_to admin_tour_path(@tour) }
          format.xml  { head :ok }
      else                   
        format.html { render :new }
        format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @tour = Tour.find_using_slug(params[:id])
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to admin_tours_path }
      format.xml  { head :ok }
    end
  end
  
end
