class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:alert] = "Logged in!"
      redirect_to user_path(@user)
    else
      flash[:danger] = "Incorrect password"
      render :new
    end
  end

  def destroy
    reset_session
    flash[:alert] = "Logged out!"
    redirect_to login_path
  end

end