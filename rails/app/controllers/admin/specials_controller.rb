class Admin::SpecialsController < AdminController
  
  def index
    @specials = Special.all.paginate(:per_page => 10, :page => params[:page])
  end
  
  def new
    @special = Special.new
  end
  
  def create
    @special = Special.new(params[:special])
    @special.save!
    flash[:success] = 'Special saved'
    redirect_to admin_specials_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving special'
    render :new
  end
  
  def edit
    @special = Special.find(params[:id])
  end
  
  def update
    @special = Special.find(params[:id])
    @special.update_attributes!(params[:special])
    flash[:success] = 'Special updated'
    redirect_to admin_specials_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating special'
    render :edit
  end
  
  def destroy
    @special = Special.find(params[:id])
    @special.destroy
    flash[:notice] = 'Special removed'
    redirect_to admin_specials_path
  end
  
end
