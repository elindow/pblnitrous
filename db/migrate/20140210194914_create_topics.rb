class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :topicName
      t.text :comments

      t.timestamps
    end
  end
end
