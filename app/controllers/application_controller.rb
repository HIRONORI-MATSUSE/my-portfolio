class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :login_required
    
    private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
      redirect_to new_session_path unless current_user
    end
end
