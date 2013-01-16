class CreateProcedures < ActiveRecord::Migration
  def change
    create_table :procedures do |t|
      t.string :name
      t.integer :delay

      t.timestamps
    end
  end
end
