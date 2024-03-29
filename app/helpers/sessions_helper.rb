module SessionsHelper

# ログイン機能
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def log_in(user)
        session[:user_id] = user.id
    end

# ログアウト機能
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
