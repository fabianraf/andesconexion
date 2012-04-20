class TravelPackage < ActiveRecord::Base
  belongs_to :private_service
  validates :name, :presence => true
  has_attached_file :image,
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
                    :url => "/system/:class/:attachment/:id/:style/:filename"
end
