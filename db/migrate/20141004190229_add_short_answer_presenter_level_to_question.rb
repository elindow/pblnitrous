class AddShortAnswerPresenterLevelToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :shortAnswer, :string
    add_column :questions, :presenter1, :string
    add_column :questions, :presenter2, :string
    add_column :questions, :level, :integer
  end
end
