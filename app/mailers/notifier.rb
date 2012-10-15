class Notifier < ActionMailer::Base
  
  TEST_RECIPIENT = ["fabianraf@gmail.com"]
  default :from => ANDES_CONFIG['email_from']
  
  def send_book_now_information(contact_us)    
    if Rails.env.production?
      
    else
      @emails = TEST_RECIPIENT
    end    
    @contact_us = contact_us                        
    if Rails.env.production                                       
      mail(:to => @emails, :subject => "Book Now" )
    else
      mail(:to => @emails, :subject => "#{Rails.env} - Book Now" )
    end
    
  end
end