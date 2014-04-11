class Special < ActiveRecord::Base
  
  has_attached_file :icon,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension",
                    :default_url => "http://placehold.it/120x120",
                    :styles => {:main => "120x120#", :thumb => "100x50>"}
                    
  validates_attachment_presence :icon
  validates_attachment_size :icon, :less_than => 2.megabytes
  
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  
end
