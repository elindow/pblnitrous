class CreatePerfTypes < ActiveRecord::Migration
  def change
    create_table :perf_types do |t|
      t.integer :ps
      t.integer :pt
      t.integer :as
      t.integer :cq
      t.integer :po
      t.integer :io
      t.integer :db
      t.references :question, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
