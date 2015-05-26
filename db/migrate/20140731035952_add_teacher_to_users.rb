class AddTeacherToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :teacher, :boolean, :default => false
  end
  
  def self.down
    remove_column :users, :teacher
  end
end
