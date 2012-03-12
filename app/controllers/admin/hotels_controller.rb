class Admin::HotelsController < Admin::BaseController
  def index
    @hotels = Hotel.paginate(:all, :page => params[:page] || 1, :per_page => 5, :order => "name")
  end
  def new
    @hotel = Hotel.new
    #@hotel.hotel_images.build
  end
  def show
    @hotel = Hotel.find(params[:id])
  end
  def create
    @hotel = Hotel.new(params[:hotel])
    respond_to do |format|
      if @hotel.save
        flash[:notice] = 'Hotel was successfully created.'
        format.html { redirect_to admin_hotels_path }
        format.xml  { head :ok }
      else
        format.html { render :new }
        format.xml  { render :xml => @hotel.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @hotel = Hotel.find(params[:id])
  end
  
  def update
    @hotel = Hotel.find(params[:id])
    respond_to do |format|
      if @hotel.update_attributes(params[:hotel])
        flash[:notice] = 'Hotel was successfully updated.'
          format.html { redirect_to admin_hotels_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @hotel.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @hotel = Hotel.find(params[:id])
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to admin_hotels_path }
      format.xml  { head :ok }
    end
  end
  
end
