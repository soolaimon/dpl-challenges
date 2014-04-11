class Admin::StudentsController < AdminController
  
  def index
    @students = Student.all.paginate(:per_page => 20, :page => params[:page], :order => 'name DESC')
  end
  
  def new
    @student = Student.new
  end
  
  def create
    @student = Student.new(params[:student])
    @student.save!
    flash[:success] = 'Student saved'
    redirect_to admin_students_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving student'
    render :new
  end
  
  def edit
    @student = Student.find(params[:id])
  end
  
  def update
    @student = Student.find(params[:id])
    @student.update_attributes!(params[:student])
    flash[:success] = 'Student updated'
    redirect_to admin_students_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating student'
    render :edit
  end
  
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    flash[:notice] = 'Student removed'
    redirect_to admin_students_path
  end
  
end
