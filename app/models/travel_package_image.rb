class TravelPackageImage < ActiveRecord::Base
  belongs_to :travel_package
  has_attached_file :attachment, :styles => { :mini => '48x48>', :small => '100x100>', :large => '600x600>' },
                    :default_style => :small,
                    :url => :default_travel_package_image_url,
                    :path => :default_travel_package_image_path
                  
  def default_travel_package_image_url
    return "/system/uploads/:class/:id_partition/:style/:filename"
  end

  def default_travel_package_image_path
    return ":rails_root/public/system/uploads/:class/:id_partition/:style/:filename"
  end  
 
end
