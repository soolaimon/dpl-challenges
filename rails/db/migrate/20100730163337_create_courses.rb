class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :title
      t.text :caption
      t.string :course_type
      t.timestamps
    end
    
    add_index :courses, [ :course_type ]
  end

  def self.down
    drop_table :courses
  end
end
