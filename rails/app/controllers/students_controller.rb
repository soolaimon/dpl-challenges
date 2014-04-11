class StudentsController < SiteController
  
  before_filter :redirect_if_not_logged_in, :only => [ :edit, :update ]
  
  def index
    @disciplines = Student.all(:order => 'discipline ASC').collect { |s| s.discipline }.compact.uniq.unshift(' ')
    if params[:discipline]
      @students = Student.find_all_by_discipline(params[:discipline]).paginate(:per_page => 50, :page => params[:page], :order => 'rank DESC')
    else
      @students = Student.all.paginate(:per_page => 50, :page => params[:page], :order => 'rank DESC')
    end
  end
  
  def show
    @student = Student.find(params[:id])
  end
  
  def edit
    @student = current_account.student
  end
  
  def update
    @student = current_account.student
    @student.update_attributes!(params[:student])
    flash[:success] = 'Information updated'
    redirect_to student_path(@student)
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating information'
    render :edit
  end
  
  private
  
    def redirect_if_not_logged_in
      student = Student.find(params[:id])
      if !current_account || current_account.student != student
        flash[:error] = 'You must be logged in as that student'
        redirect_to student_path(student)
      end
    end
  
  
end
