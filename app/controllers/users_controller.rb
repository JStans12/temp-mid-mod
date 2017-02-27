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
      flash[:error] = error_key[error]
      redirect_to :signup
    end
  end

  private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def error_key
      {"has already been taken" => "email has already been taken",
       "doesn't match Password" => "passwords don't match"}
    end
end
