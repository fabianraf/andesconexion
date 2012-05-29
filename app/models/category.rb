class Category < ActiveRecord::Base
  include SortOrder
  acts_as_nested_set
  has_many :tours
  has_one :middle_homepage_image
  has_one :category_image
  #attr_accessible :name, :parent_id, :description, :is_present_in_middle_homepage, :is_present_in_lowerpage, :homepage_photo
  scope :without_parents, :conditions => {:parent_id => nil}
  scope :middle_homepage_active, :conditions => {:is_present_in_middle_homepage => true}
  scope :lower_homepage_active, :conditions => {:is_present_in_lowerpage => true}
  validates :name, :description, :category_image, :presence => true
  #after_validation :check_if_middle_homepage_is_selected, :check_if_lower_homepage_is_selected
  accepts_nested_attributes_for :middle_homepage_image, :category_image
  def to_param  # overridden in order to show the name in the url
     "#{id}-#{name}"
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
  
end
