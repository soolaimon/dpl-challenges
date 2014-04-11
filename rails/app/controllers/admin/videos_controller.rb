class Admin::VideosController < AdminController
  
  def index
    @videos = Video.all.paginate(:per_page => 10, :page => params[:page])
  end
  
  def new
    @video = Video.new
  end
  
  def create
    @video = Video.new(params[:video])
    @video.save!
    flash[:success] = 'Video saved'
    redirect_to admin_videos_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving video'
    render :new
  end
  
  def edit
    @video = Video.find(params[:id])
  end
  
  def update
    @video = Video.find(params[:id])
    @video.update_attributes!(params[:video])
    flash[:success] = 'Video updated'
    redirect_to admin_videos_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating video'
    render :edit
  end
  
  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:notice] = 'Video removed'
    redirect_to admin_videos_path
  end
  
end
