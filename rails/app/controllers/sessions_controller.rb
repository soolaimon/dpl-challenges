class SessionsController < SiteController
  
  def new
    @session = AccountSession.new
  end
  
  def create
    @session = AccountSession.new(params[:account_session])
    if @session.save
      flash[:success] = 'Welcome'
      redirect_to student_path(current_account.student)
    else
      flash[:error] = 'Error logging in'
      render :new
    end
  end
  
  def destroy
    @session = AccountSession.find
    @session.destroy
    flash[:notice] = 'Logged out'
    redirect_to students_path
  end
  
  def activate
    @account = Account.find_using_perishable_token(params[:activation_code], 1.week) || (raise Exception)
    raise Exception if @account.active?

    if @account.activate!
      flash[:success] = "Your account has been activated!"
      AccountSession.create(@account, false) # Log user in manually
      @account.deliver_welcome!
      redirect_to students_path
    else
      render :new
    end
    
  end
  
  
end
