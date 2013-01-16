class CreateSpecialists < ActiveRecord::Migration
  def change
    create_table :specialists do |t|
      t.string :fio
      t.string :login
      t.string :password
      t.boolean :admin
      t.integer :mode_id
      t.integer :room

      t.timestamps
    end
  end
end
