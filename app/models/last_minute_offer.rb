class LastMinuteOffer < ActiveRecord::Base
  has_many :last_minute_dates
  has_attached_file :image,
                    :path => ":rails_root/public/system/:class/:attachment/:id/:style/:basename.:extension",
                    :url => "/system/:class/:attachment/:id/:style/:filename"
end
