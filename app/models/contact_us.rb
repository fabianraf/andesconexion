class ContactUs < ActiveRecord::Base
  validates :email, :destination_or_package_of_interest, :presence => true
end
