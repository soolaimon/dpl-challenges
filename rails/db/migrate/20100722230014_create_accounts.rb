class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.string :role
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :perishable_token
      t.boolean :active, :default => false, :null => false
      t.integer :student_id
      t.timestamps
    end
    
    add_index :accounts, [ :student_id, :email, :perishable_token ]
  end

  def self.down
    drop_table :accounts
  end
end
