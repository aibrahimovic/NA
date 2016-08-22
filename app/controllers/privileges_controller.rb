class PrivilegesController < ApplicationController
  before_action :set_privilege, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_logged_in

  # GET /privileges
  # GET /privileges.json
  def index
    @privileges = Privilege.all
    current_user
    raise
  end

  # GET /privileges/1
  # GET /privileges/1.json
  def show
  end

  # GET /privileges/new
  def new
    @privilege = Privilege.new
    @roles = Role.all
  end

  # GET /privileges/1/edit
  def edit
  end

  # POST /privileges
  # POST /privileges.json
  def create
    @privilege = Privilege.new(privilege_params)

    respond_to do |format|
      if @privilege.save
        format.html { redirect_to privileges_url, notice: 'Privilegija je uspješno kreirana.' }
        format.json { render :show, status: :created, location: @privilege }
      else
        format.html { render :new }
        format.json { render json: @privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /privileges/1
  # PATCH/PUT /privileges/1.json
  def update
    respond_to do |format|
      if @privilege.update(privilege_params)
        format.html { redirect_to privileges_url, notice: 'Privilegija je uspješno izmjenjena.' }
        format.json { render :show, status: :ok, location: @privilege }
      else
        format.html { render :edit }
        format.json { render json: @privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /privileges/1
  # DELETE /privileges/1.json
  def destroy
    role_privileges = RolePrivilege.where(privilege_id: @privilege.id).all
    role_privileges.destroy_all
    @privilege.destroy
    respond_to do |format|
      format.html { redirect_to privileges_url, notice: 'Privilegija je uspješno obrisana.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_privilege
      @privilege = Privilege.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def privilege_params
      params.require(:privilege).permit(:name)
    end
end
