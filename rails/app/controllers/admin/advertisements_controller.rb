class Admin::AdvertisementsController < AdminController
  
  def index
    @advertisements = Advertisement.all.paginate(:per_page => 10, :page => params[:page])
  end
  
  def new
    @advertisement = Advertisement.new
  end
  
  def create
    @advertisement = Advertisement.new(params[:advertisement])
    @advertisement.save!
    flash[:success] = 'Advertisement saved'
    redirect_to admin_advertisements_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving advertisement'
    render :new
  end
  
  def edit
    @advertisement = Advertisement.find(params[:id])
  end
  
  def update
    @advertisement = Advertisement.find(params[:id])
    @advertisement.update_attributes!(params[:advertisement])
    flash[:success] = 'Advertisement updated'
    redirect_to admin_advertisements_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating advertisement'
    render :edit
  end
  
  def destroy
    @advertisement = Advertisement.find(params[:id])
    @advertisement.destroy
    flash[:notice] = 'Advertisement removed'
    redirect_to admin_advertisements_path
  end
  
end
