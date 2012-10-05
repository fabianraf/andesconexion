class LastMinuteOffer < ActiveRecord::Base
  is_impressionable
  include SortOrder
  has_many :last_minute_dates
  has_attached_file :image, :styles => { :mini => '48x48>', :small => '100x100>', :large => '600x600>' },
                    :default_style => :small,
                    :url => :default_main_tour_image_url,
                    :path => :default_main_tour_image_path
                  
  def default_main_tour_image_url
    return "/system/uploads/:class/:id_partition/:style/:filename"
  end

  def default_main_tour_image_path
    return ":rails_root/public/system/uploads/:class/:id_partition/:style/:filename"
  end
  scope :active, :conditions => { :is_highlighted => true }
	scope :inactive, :conditions => { :is_highlighted => false }
  
end

