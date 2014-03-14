class ToursController < ApplicationController
  def show
    @tour = Category.find_by_cached_slug(params[:sub_category]).tours.find_by_cached_slug(params[:tour])
    @page_title = @tour.page_title
    @meta_content = @tour.meta_tag
    @category = @tour.category.parent
#    impressionist(@tour)
  end
    
  def book_now
    @tour = Tour.find_by_cached_slug(params[:id])
    @book = Book.new
  end
  
  def create_book
    p "========="
    p params
    @book = Book.new(params[:book])
    @tour = @book.tour
    respond_to do |format| 
      if @book.save                              
        Notifier.send_tour_book_information(@book).deliver
        format.html { redirect_to contact_us_path }
      else
        format.html { render :book_now, :locals => {:book => @book} }
        format.xml  { render :xml => @book.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
