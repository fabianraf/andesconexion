class Tour < ActiveRecord::Base
  is_impressionable
  has_one :main_tour_image
  belongs_to :category
  validates :name, :main_tour_image, :presence => true
  accepts_nested_attributes_for :main_tour_image
  def to_param  # overridden in order to show the name in the url
     "#{id}-#{name}"
  end
end
