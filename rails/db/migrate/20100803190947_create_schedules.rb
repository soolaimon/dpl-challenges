class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.datetime :date
      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
