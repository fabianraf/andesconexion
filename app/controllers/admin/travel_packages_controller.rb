class Admin::TravelPackagesController < Admin::BaseController
  def index
    @travel_packages = TravelPackage.find(:all)
  end
end
