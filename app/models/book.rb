class Book < ActiveRecord::Base
  validates :first_name, :last_name, :email, :comments, :presence => true     
  belongs_to :tour
  
  def fullname
    "#{self.first_name} #{self.last_name}"
  end
  
end
