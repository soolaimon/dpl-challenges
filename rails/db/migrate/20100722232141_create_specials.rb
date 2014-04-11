class CreateSpecials < ActiveRecord::Migration
  def self.up
    create_table :specials do |t|
      t.string :title
			t.text :text
			t.string :icon_file_name
			t.string :icon_content_type
			t.integer :icon_file_size
			t.string :link
      t.timestamps
    end
  end

  def self.down
    drop_table :specials
  end
end
