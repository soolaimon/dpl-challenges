class Page < ActiveRecord::Base
  
  validates_presence_of :permalink, :on => :create, :message => "can't be blank"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
  has_attached_file :image,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension",
                    :default_url => "http://placehold.it/870x300",
                    :styles => {:main => "334x547#", :thumb => "100x50>"}
                    
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 2.megabytes
  
  before_save :sanitize_permalink
  
  private

    def sanitize_permalink
      self.permalink = (permalink.blank? ? "#{id}-#{name.parameterize}" : "#{permalink.parameterize}")
    end
  
end
