class ApplicationController < ActionController::Base
  include SessionsHelper

  append_before_action :require_login

  private

  def require_login
    flash[:danger] = "Please log in to access this page."
    redirect_to root_path unless current_user
  end

end
