class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :image_file_name
			t.integer :image_file_size
			t.string :image_content_type
			t.string :name
			t.text :text
			t.string :permalink
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
