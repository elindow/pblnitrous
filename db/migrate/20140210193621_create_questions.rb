class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :num
      t.integer :page
      t.text :qtext
      t.text :notes

      t.timestamps
    end
  end
end
