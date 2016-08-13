class SessionsController < ApplicationController
	#before_filter :confirm_logged_in

	  def new
	  end

	  def create
	  	user = User.find_by(username: params[:session][:username].downcase)
	    #if user && user.authenticate(params[:session][:password])
	       # log_in user
	      #	redirect_to new_ensemble_path

	    #else
	    respond_to do |format|
	      if user && user.authenticate(params[:session][:password])
	      	log_in user
	        format.html { redirect_to new_ensemble_path }
	      else
	        format.html { redirect_to root_url, notice: 'Korisničko ime ili šifra nisu ispravni.' }
	      end
	    end
	      # Create an error message.
	      #flash[:danger] = 'Invalid email/password combination'
	      #render 'new'
	   # end
	  end

	  def destroy
	  	log_out
	    redirect_to root_url
	  end

end
