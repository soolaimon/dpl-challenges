class GalleryPhoto < ActiveRecord::Base
  
  has_attached_file :image,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension",
                    :default_url => "http://placehold.it/330x200",
                    :styles => {:large => "800x600>", :main => "330x200>", :thumb => "100x50>"}
                    
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 2.megabytes
  
  
  
end
