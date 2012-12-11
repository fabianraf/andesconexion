class StandalonePage < ActiveRecord::Base
  include SortOrder
  belongs_to :created_by, :foreign_key => 'created_by_id', :class_name => 'User'
  belongs_to :last_updated_by, :foreign_key => 'last_updated_by_id', :class_name => 'User'
  scope :is_active, :conditions => {:is_active => true}
  def to_param  # overridden in order to show the name in the url
     "#{id}-#{name}"
  end
end
