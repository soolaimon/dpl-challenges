class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
			t.datetime :age
			t.string :birthplace
			t.string :hometown
			t.text :strengths
			t.string :discipline
			t.string :rank
			t.text :bio
			t.string :youtube_key
			t.string :main_image_file_name
			t.integer :main_image_file_size
			t.string :main_image_content_type
			t.string :add_image1_file_name
			t.integer :add_image1_file_size
			t.string :add_image1_content_type
			t.string :add_image2_file_name
			t.integer :add_image2_file_size
			t.string :add_image2_content_type
			t.string :add_image3_file_name
			t.integer :add_image3_file_size
			t.string :add_image3_content_type
			t.string :add_image4_file_name
			t.integer :add_image4_file_size
			t.string :add_image4_content_type
      t.timestamps
    end
    
    add_index :students, [ :name ]
  end

  def self.down
    drop_table :students
  end
end
