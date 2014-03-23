class TourDay < ActiveRecord::Base
  belongs_to :tour
  # validates :day_name, :presence => true
end
