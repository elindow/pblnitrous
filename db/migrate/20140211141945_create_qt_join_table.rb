class CreateQtJoinTable < ActiveRecord::Migration
  def change
    create_join_table :questions, :topics do  |t|
      #t.integer :question_id
      #t.integer :topic_id
      # t.index [:question_id, :topic_id]
      # t.index [:topic_id, :question_id]
    end
  end
end
