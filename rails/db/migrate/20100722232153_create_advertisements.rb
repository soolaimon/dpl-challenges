class CreateAdvertisements < ActiveRecord::Migration
  def self.up
    create_table :advertisements do |t|
      t.string :image_file_name
			t.integer :image_file_size
			t.string :image_content_type
			t.string :link
      t.timestamps
    end
  end

  def self.down
    drop_table :advertisements
  end
end
