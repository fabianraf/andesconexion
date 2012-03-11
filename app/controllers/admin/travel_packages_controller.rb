class Admin::TravelPackagesController < Admin::BaseController
  def index
    @travel_packages = TravelPackage.paginate(:all, :page => params[:page] || 1, :per_page => 5, :order => "name")
  end
  def new
    @travel_package = TravelPackage.new
    #@travel_package.travel_package_images.build
  end
  
  def show
    @travel_package = TravelPackage.find(params[:id])
  end
  def create
    @travel_package = TravelPackage.new(params[:travel_package])
    respond_to do |format|
      if @travel_package.save
        flash[:notice] = 'Travel Package was successfully created.'
        format.html { redirect_to admin_travel_packages_path }
        format.xml  { head :ok }
      else
        format.html { render :new }
        format.xml  { render :xml => @travel_package.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @travel_package = TravelPackage.find(params[:id])
  end
  
  def update
    @travel_package = TravelPackage.find(params[:id])
    respond_to do |format|
      if @travel_package.update_attributes(params[:travel_package])
        flash[:notice] = 'Company was successfully updated.'
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
