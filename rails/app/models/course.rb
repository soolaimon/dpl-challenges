class Course < ActiveRecord::Base
  
  TYPES = ["Discipline", "Program"]
  
  has_and_belongs_to_many :instructors
  has_many :programs
  
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :title, :on => :create, :message => "already exists."
  
end
