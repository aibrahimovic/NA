class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include EnsemblesHelper

  def confirm_logged_in
    unless current_user
        flash[:notice] = "Vaša sesija je isteka. Unesite vaše korisničke podatke."
        redirect_to :root
        return false
    else
        set_document_rendering(false)
        return true
    end
end

end
