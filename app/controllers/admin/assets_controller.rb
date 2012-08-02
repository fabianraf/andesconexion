class Admin::AssetsController < Admin::BaseController
    
  def index
    #@tours = Asset.with_tours   Asset.limit(:all).group(:id)
    @assets = Asset.limit(:all).page(params[:page]).per(10)
    @horizontal_number_assets = 1;
    @max_number_assets = 21;
  end
  def index_new
    #@tours = Asset.with_tours   Asset.limit(:all).group(:id)
    @assets = Asset.limit(:all).page(params[:page]).per(10)
    @horizontal_number_assets = 1;
    @max_number_assets = 21;
  end
  def new
    @Asset = Asset.find(params[:Asset_id])
    @tour = @Asset.tours.new
    @tour.build_main_tour_image
  end
  def show
    @tour = Asset.find(params[:Asset_id]).tours.find(params[:id])
  end
  def create
    @Asset = Asset.find(params[:Asset_id])
    @tour = @Asset.tours.new(params[:tour])
    respond_to do |format|
      if @tour.save
        flash[:notice] = 'tour was successfully created.'
        format.html { redirect_to admin_Asset_tours_path(@Asset) }
        format.xml  { head :ok }
      else
        @tour.build_main_tour_image
        format.html { render :new, :locals => {:tour => @tour} }
        format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @Asset = Asset.find(params[:Asset_id])
    @tour = @Asset.tours.find(params[:id])
  end
  
  def update
    @tour = Asset.find(params[:Asset_id]).tours.find(params[:id])
    respond_to do |format|
      if @tour.update_attributes(params[:tour])
        flash[:notice] = 'tour was successfully updated.'
          format.html { redirect_to show_tours_admin_Asset_path(Asset.find(params[:Asset_id])) }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @tour.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @tour = Asset.find(params[:Asset_id]).tours.find(params[:id])
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to admin_Asset_tours_path }
      format.xml  { head :ok }
    end
  end
end
