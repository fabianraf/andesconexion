class PrivateService < ActiveRecord::Base
  has_many :travel_packages
  has_many :guide_or_driver_tours, :through => :travel_packages
end
