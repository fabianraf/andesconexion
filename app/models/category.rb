class Category < ActiveRecord::Base
  include SortOrder
  acts_as_nested_set
  has_many :tours
  attr_accessible :name, :parent_id, :description, :is_present_in_homepage, :homepage_photo
  scope :without_parents, :conditions => {:parent_id => nil}
  scope :homepage_active, :conditions => {:is_present_in_homepage => true}
  has_attached_file :homepage_photo,
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
                    :url => "/system/:class/:attachment/:id/:style/:filename"
  
  def to_param  # overridden in order to show the name in the url
     "#{id}-#{name}"
  end
end
