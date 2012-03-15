class Admin::TravelPackagesController < Admin::BaseController
  def index
    @private_service = PrivateService.find(params[:private_service_id])
    @travel_packages = @private_service.travel_packages.paginate(:all, :page => params[:page] || 1, :per_page => 5, :order => "name")
  end
  def new
    @private_service = PrivateService.find(params[:private_service_id])
    @travel_package = TravelPackage.new
    #@travel_package.travel_package_images.build
  end
  
  def show
    @travel_package = TravelPackage.find(params[:id])
  end
  def create
    travel_package = PrivateService.find(params[:private_service_id]).travel_packages.new(params[:travel_package])
    respond_to do |format|
      if travel_package.save
        flash[:notice] = 'Travel Package was successfully created.'
        format.html { redirect_to admin_private_service_travel_packages_path(travel_package.private_service) }
        format.xml  { head :ok }
      else
        format.html { render :new }
        format.xml  { render :xml => travel_package.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @private_service = PrivateService.find(params[:private_service_id])
    @travel_package = @private_service.travel_packages.find(params[:id])
  end
  
  def update
    @travel_package = TravelPackage.find(params[:id])
    respond_to do |format|
      if @travel_package.update_attributes(params[:travel_package])
        flash[:notice] = 'Travel Package was successfully updated.'
          format.html { redirect_to admin_travel_packages_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @travel_package.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @travel_package = TravelPackage.find(params[:id])
    @travel_package.destroy
    respond_to do |format|
      format.html { redirect_to admin_travel_packages_path }
      format.xml  { head :ok }
    end
  end
end
