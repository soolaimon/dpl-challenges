class Admin::SearchesController < AdminController
  
  def show
    if request.post?
      if params[:query]
        @students = Student.all(:conditions => ['name LIKE ?', "%#{params[:query]}%"], :order => 'name DESC').paginate(:per_page => 20, :page => params[:page])
      else
        @students = []
      end
    else
      flash[:notice] = 'You must use the search form'
      redirect_to admin_dashboard_path
    end
  end
  
  
end
