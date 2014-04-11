class Notifier < ActionMailer::Base
  
  def activation_instructions(account)
    @recipients     = account.email
    @from           = 'no-reply@johnsgymatx.com'
    @subject        = "[John's Gym] Please activate your new account"
    @sent_on        = Time.now
    @body[:url]     = "http://johnsgymatx.com/activate/#{account.perishable_token}"
    @body[:account] = account
  end
  
  def welcome(account)
    @recipients     = account.email
    @from           = 'no-reply@johnsgymatx.com'
    @subject        = "[John's Gym] Weclome!"
    @sent_on        = Time.now
    @body[:url]     = "http://johnsgymatx.com/activate/#{account.perishable_token}"
    @body[:account] = account
  end
  
  def contact_request(params)
    @recipients     = 'jasminechoksi@johnsgymatx.com' #"getfit@johnsgymatx.com"
    @from           = 'no-reply@johnsgymatx.com'
    @subject        = "[John's Gym] Contact Form Submission"
    @sent_on        = Time.now
    @body[:params]  = params
  end
  
end
