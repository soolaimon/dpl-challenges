class Admin::BillboardsController < AdminController
  
  def index
    @billboards = Billboard.all.paginate(:per_page => 10, :page => params[:page])
  end
  
  def new
    @billboard = Billboard.new
  end
  
  def create
    @billboard = Billboard.new(params[:billboard])
    @billboard.save!
    flash[:success] = 'Billboard saved'
    redirect_to admin_billboards_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving billboard'
    render :new
  end
  
  def edit
    @billboard = Billboard.find(params[:id])
  end
  
  def update
    @billboard = Billboard.find(params[:id])
    @billboard.update_attributes!(params[:billboard])
    flash[:success] = 'Billboard updated'
    redirect_to admin_billboards_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating billboard'
    render :edit
  end
  
  def destroy
    @billboard = Billboard.find(params[:id])
    @billboard.destroy
    flash[:notice] = 'Billboard removed'
    redirect_to admin_billboards_path
  end
  
end
