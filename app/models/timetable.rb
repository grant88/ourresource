class Timetable < ActiveRecord::Base
  attr_accessible :num_ticket, :procedure_id, :specialist_id, :time_start, :time_end,:delay
end
