# -*- encoding : utf-8 -*-
class AdminController < ApplicationController
  def index
  end

  def check
    pass=params[:pass]
    login=params[:login]
    user=Specialist.where(:login=>login,:password=>pass).first
    if user
      session[:user]={:id=>user.id,:fio=>user.fio,:login=>user.login,:admin=>user.admin}
      if user.admin
        redirect_to('/specialists/')
      else
        redirect_to('/specialist_enter/show_visits')
      end

    else
      session[:err]='Не корректные данные!'
      redirect_to('/admin/index')
    end
  end

end
