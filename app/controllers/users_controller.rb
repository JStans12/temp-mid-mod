class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to :root
    else
      error = user.errors.messages.values.flatten[0]
      flash_message = error_key[error]
      flash_message = flash_message + " confirmation can't be blank." if confirmation_blank
      flash[:error] = flash_message
      redirect_to :signup
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def confirmation_blank
      params[:user][:password_confirmation] == ""
    end

    def error_key
      {"has already been taken" => "email has already been taken.",
       "doesn't match Password" => "passwords don't match.",
       "can't be blank" => "password can't be blank."}
    end
end
