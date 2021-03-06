class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_logged_in

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    #@groups_test = Application::NUMBER_OF_TEACHER_PER_GROUP
    @groups_test = Constant.professor_norm
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @roles = Role.all
    @user = User.new
    
  end

  # GET /users/1/edit
  def edit
    @roles = Role.all
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    role = params[:user][:role]
    
    respond_to do |format|
      if @user.save
        UserRole.create(user_id: @user.id, role_id: role)
        
        format.html { redirect_to users_url, notice: 'Korisnik je uspješno kreiran.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    role = params[:user][:role]
    respond_to do |format|
      if @user.update(user_params)
        UserRole.create(user_id: @user.id, role_id: role)
        format.html { redirect_to users_url, notice: 'Korisnik je uspješno izmjenjen.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Korisnik je uspješno obrisan.' }
      format.json { head :no_content }
    end
  end

  def passwordChange
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end
end
