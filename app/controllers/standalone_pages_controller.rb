class StandalonePagesController < ApplicationController
  
  def show
    @standalone_page = StandalonePage.find(params[:id])
  end
  
end
