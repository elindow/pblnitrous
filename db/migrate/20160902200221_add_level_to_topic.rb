class AddLevelToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :lev1, :boolean
    add_column :topics, :lev2, :boolean
  end
end
