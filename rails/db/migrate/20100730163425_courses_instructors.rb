class CoursesInstructors < ActiveRecord::Migration
  def self.up
    create_table :courses_instructors, :id => false do |t|
      t.integer :course_id
      t.integer :instructor_id
      t.timestamps
    end
    
    add_index :courses_instructors, [ :course_id, :instructor_id ]
  end

  def self.down
    drop_table :courses_instructors
  end
end
