class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_logged_in

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = Teacher.all
  end

  # GET /teachers/1
  # GET /teachers/1.json
  def show
  end

  # GET /teachers/new
  def new
    @teacher = Teacher.new
  end

  # GET /teachers/1/edit
  def edit
  end

  # POST /teachers
  # POST /teachers.json
  def create
    @teacher = Teacher.new(teacher_params)

    @teacher.election_date_end = @teacher.election_date + @teacher.election_period.year
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to teachers_url, notice: 'Nastavnik je uspješno kreiran.' }
        format.json { render :show, status: :created, location: @teacher }
      else
        format.html { render :new }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teachers/1
  # PATCH/PUT /teachers/1.json
  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to teachers_url, notice: 'Nastavnik je uspješno izmjenjen.' }
        format.json { render :show, status: :ok, location: @teacher }
      else
        format.html { render :edit }
        format.json { render json: @teacher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teachers/1
  # DELETE /teachers/1.json
  def destroy
    @teacher.destroy
    ensemble = Ensemble.where(teacher_id: @teacher.id).all
    ensemble.destroy_all
    respond_to do |format|
      format.html { redirect_to teachers_url, notice: 'Nastavnik je uspješno obrisan.' }
      format.json { head :no_content }
    end
  end

  def getTeachers
    @teachers = Teacher.all
    respond_to do |format|
      format.json { render :json => @teachers }
    end
     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher
      @teacher = Teacher.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def teacher_params
      params.require(:teacher).permit(:first_name, :last_name, :title, :position, :election_date, :election_period, :department_id)
    end
end
