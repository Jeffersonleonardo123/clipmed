class LoginController < ApplicationController

  def home
  end

  def autentication
      user = User.find_by_email(params[:user][:email])
  		if user && user.valid_password?(params[:user][:password])
  			session[:user_id]= user.id
  			render action:"home"
  		else
  			flash.now[:alert] = "Email ou senha invalidas."
  			render action: "new"
  		end
  end

  def logout
		session[:user_id] = nil
		redirect_to root_path
	end


end
