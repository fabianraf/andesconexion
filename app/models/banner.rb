class Banner < ActiveRecord::Base
  has_one :banner_image
  validates :title, :description, :is_active, :presence => true
  scope :active, :conditions => {:is_active => true}
  accepts_nested_attributes_for :banner_image
end
