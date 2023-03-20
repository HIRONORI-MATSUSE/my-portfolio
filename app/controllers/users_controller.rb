class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update]

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        console
        if @user.update(user_params)
            redirect_to root_path, notice: "自己紹介を編集しました！"
        else
            render :edit
        end
    end

    private
  
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:comment, :image)
    end

end
