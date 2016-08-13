class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  

  def confirm_logged_in
    unless current_user
        flash[:notice] = "Please log in"
        redirect_to :root
        return false
    else
        return true
    end
end

end
