class Admin::StandalonePagesController < Admin::BaseController
  def index
    @standalone_pages = StandalonePage.page(params[:page]).per(10)
  end
  def new
    @standalone_page = StandalonePage.new
  end
  def show
    @standalone_page = StandalonePage.find(params[:id])
  end
  def create
    @standalone_page = StandalonePage.new(params[:standalone_page])
    respond_to do |format|
      if @standalone_page.save
        flash[:notice] = 'standalone_page was successfully created.'
        format.html { redirect_to admin_standalone_pages_path }
        format.xml  { head :ok }
      else
        format.html { render :new }
        format.xml  { render :xml => @standalone_page.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @standalone_page = StandalonePage.find(params[:id])
  end
  
  def update
    @standalone_page = StandalonePage.find(params[:id])
    respond_to do |format|
      if @standalone_page.update_attributes(params[:standalone_page])
        flash[:notice] = 'standalone_page was successfully updated.'
          format.html { redirect_to admin_standalone_pages_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @standalone_page.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @standalone_page = StandalonePage.find(params[:id])
    @standalone_page.destroy
    respond_to do |format|
      format.html { redirect_to admin_standalone_pages_path }
      format.xml  { head :ok }
    end
  end
  
  def update_order
		begin
      logger.debug "*********"
      StandalonePage.order = params[:order]
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
