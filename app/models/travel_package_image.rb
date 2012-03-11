class TravelPackageImage < ActiveRecord::Base
  belongs_to :travel_package
  has_attached_file :image,
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
                    :url => "/system/:class/:attachment/:id/:style/:filename"
 
end
