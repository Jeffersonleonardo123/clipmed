class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	@current_user ||= if session[:user_id]
  		User.find_by_id(session[:user_id])
  	end
  end
  def authorize_user
    unless current_user
      redirect_to root_path,alert:"Você precisa efetuar o login!"
    end
  end

  # def current_empresa
  #   @current_empresa = current_usuario.empresa
  # end

  helper_method :current_user
  # helper_method :current_empresa
  helper_method :authorize_user
end
