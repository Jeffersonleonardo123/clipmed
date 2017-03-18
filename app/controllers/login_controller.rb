class LoginController < ApplicationController

  def home
    @count_client = current_user.company.clients.count
    @count_profissional = current_user.company.professionals.count
    @count_agreement = current_user.company.agreements.count
    @count_attendances = current_user.company.attendances.count
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
