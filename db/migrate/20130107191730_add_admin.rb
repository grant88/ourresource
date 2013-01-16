# -*- encoding : utf-8 -*-
class AddAdmin < ActiveRecord::Migration
  def up
    Specialist.create(:admin => true, :fio => "admin", :login => "admin", :mode_id => 1, :password => "admin")
  end

  def down
  end
end
