class ApplicationController < ActionController::Base
  include SessionsHelper

  before_filter :require_login

  private

  def require_login
    unless current_user
      redirect_to login_url
    end
  end
  
end
