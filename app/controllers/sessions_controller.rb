class SessionsController < ApplicationController

	  def new
	  end

	  def create
	  	user = User.find_by(username: params[:session][:username].downcase)
	    respond_to do |format|
	      if user && user.authenticate(params[:session][:password])
	      	log_in user
	        format.html { redirect_to homePage_ensembles_path }
	      else
	        format.html { redirect_to root_url, notice: 'Korisničko ime ili šifra nisu ispravni.' }
	      end
	    end
	  end

	  def destroy
	  	log_out
	    redirect_to root_url
	  end

end
