class CreateProceduresSpecialists < ActiveRecord::Migration
  def change
    create_table :procedures_specialists, :id => false do |t|
      t.integer :procedure_id
      t.integer :specialist_id

      t.timestamps
    end
  end
end
