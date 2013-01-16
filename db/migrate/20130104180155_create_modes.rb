class CreateModes < ActiveRecord::Migration
  def change
    create_table :modes do |t|
      t.time :s_time
      t.time :f_time

      t.timestamps
    end
  end
end
