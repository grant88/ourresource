# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def check_login
    if session[:user] == nil
      redirect_to('/')
    end
  end
end
