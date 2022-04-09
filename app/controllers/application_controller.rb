class ApplicationController < ActionController::Base
  include SessionsHelper

  append_before_action :require_login

  private

  def require_login
    redirect_to login_url unless current_user
  end

end
