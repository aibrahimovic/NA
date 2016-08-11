class AllSubjectRolesController < ApplicationController
  before_action :set_all_subject_role, only: [:show, :edit, :update, :destroy]

  # GET /all_subject_roles
  # GET /all_subject_roles.json
  def index
    @all_subject_roles = AllSubjectRole.all
  end

  # GET /all_subject_roles/1
  # GET /all_subject_roles/1.json
  def show
  end

  # GET /all_subject_roles/new
  def new
    @all_subject_role = AllSubjectRole.new
  end

  # GET /all_subject_roles/1/edit
  def edit
  end

  # POST /all_subject_roles
  # POST /all_subject_roles.json
  def create
    @all_subject_role = AllSubjectRole.new(all_subject_role_params)

    raise
    respond_to do |format|
      if @all_subject_role.save
        format.html { redirect_to new_ensemble_path, notice: 'All subject role was successfully created.' }
        format.json { render :show, status: :created, location: @all_subject_role }
      else
        format.html { render :new }
        format.json { render json: @all_subject_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /all_subject_roles/1
  # PATCH/PUT /all_subject_roles/1.json
  def update
    respond_to do |format|
      if @all_subject_role.update(all_subject_role_params)
        format.html { redirect_to @all_subject_role, notice: 'All subject role was successfully updated.' }
        format.json { render :show, status: :ok, location: @all_subject_role }
      else
        format.html { render :edit }
        format.json { render json: @all_subject_role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_subject_roles/1
  # DELETE /all_subject_roles/1.json
  def destroy
    @all_subject_role.destroy
    respond_to do |format|
      format.html { redirect_to all_subject_roles_url, notice: 'All subject role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_all_subject_role
      @all_subject_role = AllSubjectRole.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def all_subject_role_params
      params.require(:all_subject_role).permit(:subject_id, :subject_role_id)
    end
end
