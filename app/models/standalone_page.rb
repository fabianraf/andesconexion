class StandalonePage < ActiveRecord::Base
  include SortOrder
  scope :is_active, :conditions => {:is_active => true}
  def to_param  # overridden in order to show the name in the url
     "#{id}-#{name}"
  end
end
