class AddModes < ActiveRecord::Migration
  def up
    Mode.create(:s_time => "08:00:00", :f_time => "12:00:00")
    Mode.create(:s_time => "12:00:00", :f_time => "15:00:00")
  end

  def down
  end
end
