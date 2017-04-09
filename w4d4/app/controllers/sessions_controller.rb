class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params[:email], session_params[:password])
    if @user
      login_user!(@user)
      redirect_to user_url(@user)
    else
      flash[:error] = ["Incorrect email or password"]
      redirect_to new_session_url
    end
  end

  def destroy
    @user ||= current_user
    if @user
      logout_user!(@user)
      redirect_to new_session_url
    else
      flash[:error] = ["You are already logged out"]
      redirect_to new_session_url
    end
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
