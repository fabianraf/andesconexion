class Tour < ActiveRecord::Base
#  is_sluggable :name
  has_one :main_tour_image
  has_many :tour_images
  has_many :books
  belongs_to :category
  belongs_to :created_by, :foreign_key => 'created_by_id', :class_name => 'User'
  belongs_to :last_updated_by, :foreign_key => 'last_updated_by_id', :class_name => 'User'
  validates :name, :main_tour_image, :category, :presence => true
  accepts_nested_attributes_for :main_tour_image, :tour_images
  scope :last_minute_offers, :conditions => {:is_last_minute_offer => true}
  scope :not_last_minute_offers, :conditions => {:is_last_minute_offer => false}
  before_create :set_cached_slug
  before_update :set_cached_slug
  
  def to_param  # overridden in order to show the name in the url
     ("#{cached_slug}").parameterize
  end
  
  private
  
  def set_cached_slug 
    new_cached_slug = self.name.downcase.gsub(/(\W|\d)/, "-")
    number = 0
    if self.name_changed?
      while Tour.find_by_cached_slug(new_cached_slug).present?
        unless number == 0
          new_cached_slug = "#{cached_slug}-#{number}" 
        else
          new_cached_slug = cached_slug
        end
        number = number + 1
      end 
      self.cached_slug = new_cached_slug
    end
  end
end
