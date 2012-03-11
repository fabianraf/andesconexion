class TravelPackage < ActiveRecord::Base
  validates :name, :price, :presence => true
  has_attached_file :image,
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
                    :url => "/system/:class/:attachment/:id/:style/:filename"
  #Following line used in case travel_package has many travel_package_images                  
  #accepts_nested_attributes_for :travel_package_images
  #has_many :travel_package_images
end
