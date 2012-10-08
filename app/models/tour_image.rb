class TourImage < Asset
  belongs_to :tour
  validates_attachment_presence :attachment
  has_attached_file :attachment, :styles => { :mini => '48x48>', :small => '100x100>', :large => '600x600>' },
                    :default_style => :small,
                    :url => :default_tour_images_url,
                    :path => :default_tour_images_path
                  
  def default_tour_images_url
    return "/system/uploads/:class/:id_partition/:style/:filename"
  end

  def default_tour_images_path
    return ":rails_root/public/system/uploads/:class/:id_partition/:style/:filename"
  end
end
