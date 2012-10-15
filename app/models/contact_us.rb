class ContactUs < ActiveRecord::Base
  validates :name, :surname, :email, :destination_or_package_of_interest, :presence => true     
  def fullname
    "#{self.name} #{self.surname}"
  end
end
