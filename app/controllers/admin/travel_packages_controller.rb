class Admin::TravelPackagesController < Admin::BaseController
  def index
    @travel_packages = TravelPackage.find(:all)
  end
  def new
    @travel_package = TravelPackage.new
  end
end
