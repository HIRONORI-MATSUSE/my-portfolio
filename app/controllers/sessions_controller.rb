class SessionsController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      log_in(user)
      redirect_to root_path, notice: "ログインしました。"
    else
      flash.now[:danger] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました。"
  end

  private
  
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
