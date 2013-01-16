class CreateSpecialistsProcedures < ActiveRecord::Migration
  def change
    create_table :specialists_procedures, :id => false do |t|
      t.integer :procedure_id
      t.integer :specialist_id
      t.timestamps
    end
  end
end
