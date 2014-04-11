class Instructor < ActiveRecord::Base
  
  has_and_belongs_to_many :courses
  has_many :programs
  
  has_attached_file :image,
                    :url => "/assets/:class/:id/:attachment/:style.:extension",
                    :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension",
                    :default_url => "http://placehold.it/290x160",
                    :styles => {:main => "290x160#", :thumb => "100x50>"}
                    
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 2.megabytes
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
  
end
