class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= Aluno.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def authorize
    #binding.pry
    redirect_to '/login' unless current_user.id.to_i == params[:id].to_i
  end



end
