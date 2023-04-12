class ApplicationController < ActionController::Base
  def current_user(id)
    @user = User.find(id)
  end
end
