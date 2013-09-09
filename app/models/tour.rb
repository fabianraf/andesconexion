class Tour < ActiveRecord::Base
  is_impressionable
  #is_sluggable :name
  has_one :main_tour_image
  has_many :tour_images
  belongs_to :category
  belongs_to :created_by, :foreign_key => 'created_by_id', :class_name => 'User'
  belongs_to :last_updated_by, :foreign_key => 'last_updated_by_id', :class_name => 'User'
  validates :name, :main_tour_image, :category, :presence => true
  accepts_nested_attributes_for :main_tour_image, :tour_images
  scope :last_minute_offers, :conditions => {:is_last_minute_offer => true}
  scope :not_last_minute_offers, :conditions => {:is_last_minute_offer => false}
#  def to_param  # overridden in order to show the name in the url
#     ("#{cached_slug}").parameterize
#  end
end
