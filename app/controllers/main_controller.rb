class MainController < ApplicationController
  def index
    if session[:user] == nil
      @admin_path = '/admin/index'
      @specialist_path = '/admin/index'
    else
      if session[:user][:admin]
        @admin_path = '/specialists'
        @specialist_path = '/admin/index'
      else
        @specialist_path = '/specialist_enter/show_visits'
        @admin_path = '/admin/index'
      end
    end
  end

  def logout
    session[:user]=nil
    redirect_to('/')
  end
end
