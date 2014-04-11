class Admin::SchedulesController < AdminController
  
  def index
    @schedules = Schedule.all(:order => 'date ASC').paginate(:per_page => 20, :page => params[:page])
  end
  
  def new
    @schedule = Schedule.new
  end
  
  def create
    @schedule = Schedule.new(params[:schedule])
    @schedule.save!
    flash[:success] = 'Schedule saved'
    redirect_to admin_schedules_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving schedule'
    render :new
  end
  
  def edit
    @schedule = Schedule.find(params[:id])
  end
  
  def update
    @schedule = Schedule.find(params[:id])
    @schedule.update_attributes!(params[:schedule])
    flash[:success] = 'Schedule updated'
    redirect_to admin_schedules_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating schedule'
    render :edit
  end
  
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    flash[:notice] = 'Schedule removed'
    redirect_to admin_schedules_path
  end
  
end
