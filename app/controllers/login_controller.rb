class LoginController < ApplicationController

  def home
    @count_client       = current_user.company.clients.count
    @count_profissional = current_user.company.professionals.count
    @count_agreement    = current_user.company.agreements.count
    @count_attendances  = current_user.company.attendances.count
  end

  def new
    session[:user_id] = nil
  end

  def autentication
    user = User.find_by_email(params[:user][:email])

    if (user && user.restart_login == "true" && params[:user][:password] == "inicio@123")
        @user = user
        render action: "restart_login"
    else
  		if user && user.valid_password?(params[:user][:password])
  			session[:user_id]= user.id
  			render action: "home"
  		else
        flash.now[:alert] = "Email ou senha invalidas."
        render action: "new"
  		end
    end
  end

  def restart_login

  end

  def save_new_password
    @user = User.find(params['user_id'])

    if (params['new_password'] == params['confirm_password']) && params['new_password']!= ''
      @user.password = params['new_password']
      @user.restart_login = 'false'

      respond_to do |format|
          if @user.save
            # flash.now[:alert] = "Senha alterada com sucesso."
            format.html { redirect_to root_path, notice: 'Senha alterada com sucesso!'  }
            # redirect_to root_path and return

          else
            # flash.now[:alert] = "Senha alterada com sucesso."
            format.html { redirect_to root_path, notice: 'Não foi possivel alterar a senha!'  }
          end
      end
    else
      flash.now[:alert] = "Senha de confirmação diferente da nova senha."
      render action: "restart_login"
    end
  end

  def logout
		session[:user_id] = nil
		redirect_to root_path
	end


end
