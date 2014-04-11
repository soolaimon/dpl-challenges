class Account < ActiveRecord::Base
  
  acts_as_authentic
  
  belongs_to :student
  
  attr_accessible :email, :password, :password_confirmation, :student_id
  
  
  def activate!
    self.active = true
    save(false)
  end
  
  def deliver_activation_instructions!
    reset_perishable_token!
    Notifier.deliver_activation_instructions(self)
  end

  def deliver_welcome!
    reset_perishable_token!
    Notifier.deliver_welcome(self)
  end
  
  def student_name
    student.nil? ? '' : student.name
  end
  
  
end
