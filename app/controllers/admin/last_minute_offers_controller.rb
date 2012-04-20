class Admin::LastMinuteOffersController < Admin::BaseController
  def index
    @last_minute_offers = LastMinuteOffer.page(params[:page]).per(10)
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
end
