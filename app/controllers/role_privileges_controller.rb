class RolePrivilegesController < ApplicationController
  before_action :set_role_privilege, only: [:show, :edit, :update, :destroy]

  # GET /role_privileges
  # GET /role_privileges.json
  def index
    @role_privileges = RolePrivilege.all
  end

  # GET /role_privileges/1
  # GET /role_privileges/1.json
  def show
  end

  # GET /role_privileges/new
  def new
    @role_privilege = RolePrivilege.new
    @roles = Role.all
    @privileges = Privilege.all
  end

  # GET /role_privileges/1/edit
  def edit
    @roles = Role.all
    @privileges = Privilege.all
  end

  # POST /role_privileges
  # POST /role_privileges.json
  def create
    @role_privilege = RolePrivilege.new(role_privilege_params)

    respond_to do |format|
      if @role_privilege.save
        format.html { redirect_to role_privileges_url, notice: 'Uloga i privilegija su uspješno povezane.' }
        format.json { render :show, status: :created, location: @role_privilege }
      else
        format.html { render :new }
        format.json { render json: @role_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /role_privileges/1
  # PATCH/PUT /role_privileges/1.json
  def update
    respond_to do |format|
      if @role_privilege.update(role_privilege_params)
        format.html { redirect_to role_privileges_url, notice: 'Uloga i privilegija su uspješno povezane.' }
        format.json { render :show, status: :ok, location: @role_privilege }
      else
        format.html { render :edit }
        format.json { render json: @role_privilege.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_privileges/1
  # DELETE /role_privileges/1.json
  def destroy
    @role_privilege.destroy
    respond_to do |format|
      format.html { redirect_to role_privileges_url, notice: 'Veza je usšešno obrisana.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role_privilege
      @role_privilege = RolePrivilege.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def role_privilege_params
      params.require(:role_privilege).permit(:role_id, :privilege_id)
    end
end
