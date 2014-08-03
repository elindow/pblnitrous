class AddViewerToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :viewer, :boolean, :default => false
  end
  def self.down
    remove_column :users, :viewer
  end
end
