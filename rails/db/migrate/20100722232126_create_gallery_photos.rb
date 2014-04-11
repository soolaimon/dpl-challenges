class CreateGalleryPhotos < ActiveRecord::Migration
  def self.up
    create_table :gallery_photos do |t|
      t.string :image_file_name
			t.integer :image_file_size
			t.string :image_content_type
			t.string :caption
      t.timestamps
    end
  end

  def self.down
    drop_table :gallery_photos
  end
end
