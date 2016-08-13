class SubjectRolesController < ApplicationController
  before_action :set_subject_role, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_logged_in

  # GET /subject_roles
  # GET /subject_roles.json
  def index
    @subject_roles = SubjectRole.all
  end

  # GET /subject_roles/1
  # GET /subject_roles/1.json
  def show
  end

  # GET /subject_roles/new
  def new
    @subject_role = SubjectRole.new
  end

  # GET /subject_roles/1/edit
  def edit
  end

  # POST /subject_roles
  # POST /subject_roles.json
  def create
    @subject_role = SubjectRole.new(subject_role_params)

    respond_to do |format|
      if @subject_role.save
        format.html { redirect_to @subject_role, notice: 'Subject role was successfully created.' }
        format.json { render :show, status: :created, location: @subject_role }
      else
        format.html { render :new }
        format.json { render json: @subject_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_roles/1
  # PATCH/PUT /subject_roles/1.json
  def update
    respond_to do |format|
      if @subject_role.update(subject_role_params)
        format.html { redirect_to @subject_role, notice: 'Subject role was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject_role }
      else
        format.html { render :edit }
        format.json { render json: @subject_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_roles/1
  # DELETE /subject_roles/1.json
  def destroy
    @subject_role.destroy
    respond_to do |format|
      format.html { redirect_to subject_roles_url, notice: 'Subject role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def getSubjectRoles
    @subject_roles = SubjectRole.all
    respond_to do |format|
      format.json { render :json => @subject_roles }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_role
      @subject_role = SubjectRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_role_params
      params.require(:subject_role).permit(:name)
    end
end
