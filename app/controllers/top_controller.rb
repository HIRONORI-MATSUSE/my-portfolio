class TopController < ApplicationController
  skip_before_action :login_required, only: [:index]

  def index
    @user = current_user
  end

end
