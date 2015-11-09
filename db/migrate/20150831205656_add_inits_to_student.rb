class AddInitsToStudent < ActiveRecord::Migration
  def change
    add_column :students, :inits, :string
  end
end
