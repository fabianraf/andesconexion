class CategoryImage < Asset
  belongs_to :category
  has_attached_file :attachment,
                    :url => :default_image_url,
                    :path => :default_image_path
  validates_attachment_presence :attachment
  
  def default_image_url
    return "/system/uploads/:class/:id/:style/:filename"
  end

  def default_image_path
    return ":rails_root/public/system/uploads/:class/:id/:style/:filename"
  end
end
