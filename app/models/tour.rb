class Tour < ActiveRecord::Base
  is_impressionable
  belongs_to :category
  validates :name, :presence => true
  
  def to_param  # overridden in order to show the name in the url
     "#{id}-#{name}"
  end
end
