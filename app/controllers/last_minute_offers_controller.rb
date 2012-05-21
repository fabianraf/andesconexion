class LastMinuteOffersController < ApplicationController
  #impressionist
  def index
    
  end
  def show
    @last_minute_offer = LastMinuteOffer.find(params[:id])
    impressionist(@last_minute_offer)
  end
end
