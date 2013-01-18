class SelectionProcedureController < ApplicationController
  def index
    @procedures_array = Procedure.all.collect {|p| [ p.name , p.id ] }
  end

  def print
   @timetable = Timetable.new(params[:timetable])
   @timetable.save
  end

  def select_procedure
     @procedure_id = params[:procedures][:id]
     @time_start = DateTime.parse(params[:week_start])+8.hour
     @time_end = DateTime.parse(params[:week_end])+15.hour

     @days_count = (@time_end - @time_start).to_i+1
     @end_array = []
     @time_now = DateTime.now
     @specialists_ids = []
     @procedure = Procedure.find(@procedure_id)
     @spec_arr = @procedure.specialists.all
     @spec_arr.each { |s| @specialists_ids << s.id  }
     @specialists_ids = @specialists_ids.uniq

     @day_iterator = @time_start
     1.upto(@days_count) do |d|
       @arr = []
       @specialists_ids.each do |s_id|
         @cur_spec = Specialist.find(s_id)
         @mode = Mode.find(@cur_spec.mode_id)
         @start_work =  @day_iterator - 8.hour + @mode.s_time.hour.hour
         @end_work = @day_iterator - 8.hour + @mode.f_time.hour.hour
         @timetables = Timetable.where(:specialist_id => s_id, :time_start => (@start_work)..(@end_work) ).order("time_start").all

         # Подготовка свободных интервалов времени
         @interval = []
         @arr = []
         if @timetables.count > 0
           @timetables.each do |s|
             @arr << {:time_start => DateTime.parse(s.time_start.to_s), :time_end => DateTime.parse(s.time_end.to_s)}
           end
           0.upto(@arr.count) do |k|
             if k == 0
               @interval << {:start => @start_work, :end => @arr[k][:time_start]}
             elsif k == @arr.count
               @interval << {:start => @arr[k-1][:time_end], :end => @end_work}
             else
               @interval << {:start => @arr[k-1][:time_end], :end => @arr[k][:time_start]}
             end
           end
         else
           @interval << {:start => @start_work, :end => @end_work}
         end

         min_delay = @cur_spec.procedures.order("delay").first.delay

         @interval.each do |interval|
           @time_iterator = interval[:start]
           while (@time_iterator >= interval[:start]) and ((@time_iterator + @procedure.delay.minute) <= interval[:end] )
             if @time_now <= @time_iterator
               @end_array << {:time_start => @time_iterator,:delay => @procedure.delay, :time_end => @time_iterator + @procedure.delay.minute, :procedure_id => @procedure.id, :proc_name => @procedure.name, :specialist_id => s_id, :spec_name => @cur_spec.fio  }
             end
               @time_iterator = @time_iterator + min_delay.minute
           end
         end

       end

       @day_iterator = @day_iterator + 1.day
     end

  end
end