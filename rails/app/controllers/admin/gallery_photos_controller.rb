class Admin::GalleryPhotosController < AdminController
  
  def index
    @photos = GalleryPhoto.all.paginate(:per_page => 10, :page => params[:page])
  end
  
  def new
    @photo = GalleryPhoto.new
  end
  
  def create
    @photo = GalleryPhoto.new(params[:gallery_photo])
    @photo.save!
    flash[:success] = 'Photo saved'
    redirect_to admin_gallery_photos_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error saving photo'
    render :new
  end
  
  def edit
    @photo = GalleryPhoto.find(params[:id])
  end
  
  def update
    @photo = GalleryPhoto.find(params[:id])
    @photo.update_attributes!(params[:gallery_photo])
    flash[:success] = 'Photo updated'
    redirect_to admin_gallery_photos_path
  rescue ActiveRecord::RecordInvalid
    flash[:error] = 'Error updating photo'
    render :edit
  end
  
  def destroy
    @photo = GalleryPhoto.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo removed'
    redirect_to admin_gallery_photos_path
  end
  
end
