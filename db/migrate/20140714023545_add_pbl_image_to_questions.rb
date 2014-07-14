class AddPblImageToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :qimage, :string
    add_column :questions, :aimage, :string
  end
end
