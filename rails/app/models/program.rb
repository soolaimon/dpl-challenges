class Program < ActiveRecord::Base
  
  belongs_to :course
  belongs_to :instructor
  belongs_to :schedule
  
  def duration
    "#{start_time.strftime("%I:%M %p")} - #{end_time.strftime("%I:%M %p")}"
  end
  
  def cancelled?
    self.status.eql?('Cancelled')
  end
  
end
