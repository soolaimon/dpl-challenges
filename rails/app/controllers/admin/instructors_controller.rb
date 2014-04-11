class Admin::InstructorsController < AdminController
  
  def index
    @instructors = Instructor.all.paginate(:per_page => 15, :page => params[:page], :order => 'name DESC')
  end
  
  def new
    @instructor = Instructor.new
  end
  
  def create
    @instructor = Instructor.new(params[:instructor])
    @instructor.save!
    flash[:success] = 'Instructor saved'
    redirect_to admin_instructors_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving instructor'
    render :new
  end
  
  def edit
    @instructor = Instructor.find(params[:id])
  end
  
  def update
    @instructor = Instructor.find(params[:id])
    @instructor.update_attributes!(params[:instructor])
    flash[:success] = 'Instructor updated'
    redirect_to admin_instructors_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating instructor'
    render :edit
  end
  
  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    flash[:notice] = 'Instructor removed'
    redirect_to admin_instructors_path
  end
  
end
