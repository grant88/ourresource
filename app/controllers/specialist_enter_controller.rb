# -*- encoding : utf-8 -*-
class SpecialistEnterController < ApplicationController
  before_filter :check_login

  def show_visits
    @timetables = Timetable.where(:specialist_id => session[:user][:id]).all
  end

end
