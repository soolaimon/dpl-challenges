class Admin::PagesController < AdminController
  
  def index
    @pages = Page.all.paginate(:per_page => 15, :page => params[:page], :order => 'name DESC')
  end
  
  def new
    @page = Page.new
  end
  
  def create
    @page = Page.new(params[:page])
    @page.save!
    flash[:success] = 'Page created successfully'
    redirect_to admin_pages_path
  rescue
    flash[:error] = 'Error creating page'
    render :new
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
    @page = Page.find(params[:id])
    @page.update_attributes!(params[:page])
    flash[:success] = 'Page updated successfully'
    redirect_to admin_pages_path
  rescue
    flash[:error] = 'Error updating page'
    render :edit
  end
  
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = 'Page removed from system'
    redirect_to admin_pages_path
  end
  
end
