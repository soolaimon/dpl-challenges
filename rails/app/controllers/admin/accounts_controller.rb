class Admin::AccountsController < AdminController
  
  def index
    @accounts = Account.all.paginate(:per_page => 20, :page => params[:page], :order => 'email DESC')
  end
  
  def new
    @account = Account.new
  end
  
  def create
    @account = Account.new(params[:account])
    if @account.save_without_session_maintenance
      @account.deliver_activation_instructions!
      flash[:success] = 'Account created, and email sent.'
      redirect_to admin_accounts_path
    else
      flash[:error] = 'Error saving account'
      render :new
    end
  end
  
  def edit
    @account = Account.find(params[:id])
  end
  
  def update
    @account = Account.find(params[:id])
    @account.update_attributes!(params[:account])
    flash[:success] = 'Account updated'
    redirect_to admin_accounts_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating account'
    render :edit
  end
  
  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    flash[:notice] = 'Account removed'
    redirect_to admin_accounts_path
  end
  
end
