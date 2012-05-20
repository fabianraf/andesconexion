class LastMinuteOffer < ActiveRecord::Base
  is_impressionable
  include SortOrder
  has_many :last_minute_dates
  has_attached_file :image,
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
                    :url => "/system/:class/:attachment/:id/:style/:filename"
  scope :active, :conditions => { :is_highlighted => true }
	scope :inactive, :conditions => { :is_highlighted => false }
end

