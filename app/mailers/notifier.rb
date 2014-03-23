class Notifier < ActionMailer::Base
  
  TEST_RECIPIENT = ["fabianraf@gmail.com"]
  PRODUCTION_RECIPIENTS = ["info@andesconexion.com", "paul@andesconexion.com"]
  default :from => ANDES_CONFIG['email_from']
  
  def emails
    if Rails.env.production?
      @emails = PRODUCTION_RECIPIENTS
    else
      @emails = TEST_RECIPIENT
    end    
    return @emails
  end
  
  def send_book_now_information(contact_us)    
    @contact_us = contact_us                        
    if Rails.env.production?                                       
      mail(:to => emails, :subject => "Book Now" )
    else
      mail(:to => emails, :subject => "#{Rails.env} - Book Now" )
    end
    
  end
  
  def send_tour_book_information(book)    
    @book = book                   
    if Rails.env.production?                                       
      mail(:to => emails, :subject => "Book Now" )
    else
      mail(:to => emails, :subject => "#{Rails.env} - Book Now" )
    end
    
  end
  
end