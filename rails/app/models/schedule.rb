class Schedule < ActiveRecord::Base
  
  has_many :programs
  
  named_scope :this_week,
    :conditions => ["date > DATE(?)", Date.today],
    :limit => 7,
    :order => "date ASC"
  
  def datetime
    date.strftime("%A %b %d")
  end
  
  def day
    date.strftime("%A")
  end
  
end
