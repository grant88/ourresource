class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.integer :specialist_id
      t.integer :procedure_id
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
