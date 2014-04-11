class Admin::ProgramsController < AdminController
  
  before_filter :get_schedule
  
  def index
    @programs = @schedule.programs
  end
  
  def new
    @program = @schedule.programs.build({:date => @schedule.date })
  end
  
  def create
    @program = @schedule.programs.build(params[:program])
    @program.save!
    flash[:success] = 'Class saved'
    redirect_to admin_schedule_programs_path(@schedule)
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving class'
    render :new
  end
  
  def edit
    @program = @schedule.programs.find(params[:id])
  end
  
  def update
    @program = @schedule.programs.find(params[:id])
    @program.update_attributes!(params[:program])
    flash[:success] = 'Class updated'
    redirect_to admin_schedule_programs_path(@schedule)
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating class'
    render :edit
  end
  
  def destroy
    @program = @schedule.programs.find(params[:id])
    @program.destroy
    flash[:notice] = 'Class removed'
    redirect_to admin_schedule_programs_path(@schedule)
  end
  
  private
  
    def get_schedule
      @schedule = Schedule.find(params[:schedule_id])
    end
  
end
