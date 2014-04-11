class CreatePrograms < ActiveRecord::Migration
  def self.up
    create_table :programs do |t|
      t.date :date
			t.time :start_time
			t.time :end_time
			t.integer :course_id
			t.integer :instructor_id
			t.integer :schedule_id
			t.string :status
      t.timestamps
    end
    
    add_index :programs, [ :course_id, :instructor_id, :schedule_id ]
  end

  def self.down
    drop_table :programs
  end
end
