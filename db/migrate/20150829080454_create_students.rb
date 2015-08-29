class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :lname
      t.string :fname
      t.string :clsname
      t.integer :grade
      t.boolean :genderf

      t.timestamps
    end
  end
end
