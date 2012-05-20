class Admin::LastMinuteOffersController < Admin::BaseController
  def index
    @last_minute_offers = LastMinuteOffer.page(params[:page]).per(10).order("sort_order asc")
  end
  def new
    @last_minute_offer = LastMinuteOffer.new
    #@last_minute_offer.hotel_images.build
  end
  def show
    @last_minute_offer = LastMinuteOffer.find(params[:id])
  end
  def create
    @last_minute_offer = LastMinuteOffer.new(params[:last_minute_offer])
    respond_to do |format|
      if @last_minute_offer.save
        flash[:notice] = 'LastMinuteOffer was successfully created.'
        format.html { redirect_to admin_last_minute_offers_path }
        format.xml  { head :ok }
      else
        format.html { render :new }
        format.xml  { render :xml => @last_minute_offer.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def edit
    @last_minute_offer = LastMinuteOffer.find(params[:id])
  end
  
  def update
    @last_minute_offer = LastMinuteOffer.find(params[:id])
    respond_to do |format|
      if @last_minute_offer.update_attributes(params[:last_minute_offer])
        flash[:notice] = 'LastMinuteOffer was successfully updated.'
          format.html { redirect_to admin_last_minute_offers_path }
          format.xml  { head :ok }
      else
        format.html { render :edit }
        format.xml  { render :xml => @last_minute_offer.errors, :status => :unprocessable_entity }
      end
    end 
  end
  
  def destroy
    @last_minute_offer = LastMinuteOffer.find(params[:id])
    @last_minute_offer.destroy
    respond_to do |format|
      format.html { redirect_to admin_last_minute_offers_path }
      format.xml  { head :ok }
    end
  end
  
  def update_status
	  investment_content = InvestmentContent.find(params[:id])
	  investment_content.status = params[:status]
	  if investment_content.save
		  flash[:notice] = "InvestmentContent status saved."
	  else
		  flash[:error] = investment_content.errors
	  end
	  redirect_to :back
  end
  
  def update_order
		begin
      LastMinuteOffer.order = params[:order]
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


