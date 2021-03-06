class Category < ActiveRecord::Base
  include SortOrder
  acts_as_nested_set
#  is_sluggable :name
  has_many :tours
  has_one :middle_homepage_image
  has_one :category_image
  belongs_to :created_by, :foreign_key => 'created_by_id', :class_name => 'User'
  belongs_to :last_updated_by, :foreign_key => 'last_edited_by_id', :class_name => 'User'

  #attr_accessible :name, :parent_id, :description, :is_present_in_middle_homepage, :is_present_in_lowerpage, :homepage_photo
  scope :without_parents, :conditions => {:parent_id => nil}
  scope :with_parents, where("parent_id is not null AND depth = 1")
  scope :middle_homepage_active, :conditions => {:is_present_in_middle_homepage => true}
  scope :lower_homepage_active, :conditions => {:is_present_in_lowerpage => true}
  scope :with_tours, joins(:tours).where("tours.category_id IS NOT NULL")
  validates :name, :description, :category_image, :presence => true
  #after_validation :check_if_middle_homepage_is_selected, :check_if_lower_homepage_is_selected
  accepts_nested_attributes_for :middle_homepage_image, :category_image
  before_create :set_cached_slug
  before_update :set_cached_slug
  
  def to_param  # overridden in order to show the name in the url
     ("#{cached_slug}")
  end
  
  def is_main_category?
    return true if self.parent.nil?
    return false unless self.parent.nil?
  end
  
  def check_if_middle_homepage_is_selected
    if self.is_present_in_middle_homepage == true
      if self.middle_homepage_image.nil?
        errors[:middle_homepage_image] = "can not be blank"
        return false
      else
        return true
      end
    else
      return true
    end
  end
  
  private
  
  def set_cached_slug 
    new_cached_slug = self.name.downcase.gsub(/(\W|\d)/, "-")
    number = 0
    if self.name_changed?
      while Category.find_by_cached_slug(new_cached_slug).present?
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
