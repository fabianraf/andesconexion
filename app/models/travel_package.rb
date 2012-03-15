class TravelPackage < ActiveRecord::Base
  has_many :guide_or_driver_tours
  belongs_to :private_service
  validates :name, :price, :presence => true
  has_attached_file :image,
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
                    :url => "/system/:class/:attachment/:id/:style/:filename"
end
