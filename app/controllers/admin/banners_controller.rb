class Admin::BannersController < Admin::BaseController
   def index
    @banners = Banner.active.page(params[:page]).per(10).order("id asc")
  end
  def new
    @banner = Banner.new
    @banner.build_banner_image
  end
  def show
    @banner = Banner.find(params[:id])
  end
  def create
    @banner = Banner.new(params[:banner])
    respond_to do |format|
      if @banner.save
        flash[:notice] = 'Banner was successfully created.'
        format.html { redirect_to admin_banners_path }
        format.xml  { head :ok }
      else
        @banner.build_banner_image
        format.html { render :new, :locals => {:Banner => @banner} }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @banner = Banner.find(params[:id])
  end
  
  def update
    @banner = Banner.find(params[:id])
    respond_to do |format|
      if @banner.update_attributes(params[:Banner])
        flash[:notice] = 'Banner was successfully updated.'
          format.html { redirect_to admin_banners_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @banner = Banner.find(params[:id])
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to admin_banners_path }
      format.xml  { head :ok }
    end
  end
  
  
end