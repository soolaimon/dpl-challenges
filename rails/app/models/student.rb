class Student < ActiveRecord::Base
  
  has_one :account
  
  has_attached_file :main_image,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension",
                    :styles => {:main => "280x350>", :small => "150x200>", :thumb => "100x50>"}
                    
  has_attached_file :add_image1,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension",
                    :styles => {:main => "100x125>", :thumb => "100x50>"}
                    
  has_attached_file :add_image2,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension",
                    :styles => {:main => "100x125>", :thumb => "100x50>"}
                    
  has_attached_file :add_image3,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension",
                    :styles => {:main => "100x125>", :thumb => "100x50>"}
                    
  has_attached_file :add_image4,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension",
                    :styles => {:main => "100x125>", :thumb => "100x50>"}
                    
  validates_attachment_presence :main_image
  validates_attachment_size :main_image, :less_than => 2.megabytes
  validates_presence_of :name, :message => "can't be blank"
  
  
  def years_old
    now = Time.now.utc.to_date
    now.year - age.year - (age.to_date.change(:year => now.year) > now ? 1 : 0)
  end
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  
end
