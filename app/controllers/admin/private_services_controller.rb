class Admin::PrivateServicesController < Admin::BaseController
  def index
    @private_services = PrivateService.paginate(:all, :page => params[:page] || 1, :per_page => 5, :order => "name")
  end
  def new
    @private_service = PrivateService.new
  end
  
  def show
    @private_service = PrivateService.find(params[:id])
  end
  def create
    @private_service = PrivateService.new(params[:private_service])
    respond_to do |format|
      if @private_service.save
        flash[:notice] = 'Travel Package was successfully created.'
        format.html { redirect_to admin_private_services_path }
        format.xml  { head :ok }
      else
        format.html { render :new }
        format.xml  { render :xml => @private_service.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @private_service = PrivateService.find(params[:id])
  end
  
  def update
    @private_service = PrivateService.find(params[:id])
    respond_to do |format|
      if @private_service.update_attributes(params[:private_service])
        flash[:notice] = 'Travel Package was successfully updated.'
          format.html { redirect_to admin_private_services_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @private_service.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @private_service = PrivateService.find(params[:id])
    @private_service.destroy
    respond_to do |format|
      format.html { redirect_to admin_private_services_path }
      format.xml  { head :ok }
    end
  end
end
