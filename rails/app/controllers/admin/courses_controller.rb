class Admin::CoursesController < AdminController
  
  def index
    @courses = Course.all.paginate(:per_page => 15, :page => params[:page], :order => 'title DESC')
  end
  
  def new
    @course = Course.new
  end
  
  def create
    @course = Course.new(params[:course])
    @course.save!
    flash[:success] = 'Course saved'
    redirect_to admin_courses_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving course'
    render :new
  end
  
  def edit
    @course = Course.find(params[:id])
  end
  
  def update
    @course = Course.find(params[:id])
    @course.update_attributes!(params[:course])
    flash[:success] = 'Course updated'
    redirect_to admin_courses_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating course'
    render :edit
  end
  
  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    flash[:notice] = 'Course removed'
    redirect_to admin_courses_path
  end
  
end
