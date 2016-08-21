class AcademicYearsController < ApplicationController
  before_action :set_academic_year, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_logged_in

  # GET /academic_years
  # GET /academic_years.json
  def index
    @academic_years = AcademicYear.all
    @academic_years = @academic_years.sort_by {|obj| -obj.id}
  end

  # GET /academic_years/1
  # GET /academic_years/1.json
  def show
  end

  # GET /academic_years/new
  def new
    @academic_year = AcademicYear.new
  end

  # GET /academic_years/1/edit
  def edit
  end

  # POST /academic_years
  # POST /academic_years.json
  def create
    @academic_year = AcademicYear.new(academic_year_params)

    respond_to do |format|
      if @academic_year.save
        format.html { redirect_to @academic_year, notice: 'Academic year was successfully created.' }
        format.json { render :show, status: :created, location: @academic_year }
      else
        format.html { render :new }
        format.json { render json: @academic_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /academic_years/1
  # PATCH/PUT /academic_years/1.json
  def update
    respond_to do |format|
      if @academic_year.update(academic_year_params)
        format.html { redirect_to academic_years_url, notice: 'Akademska godina je uspješno izmjenjena.' }
        format.json { render :show, status: :ok, location: @academic_year }
      else
        format.html { render :edit }
        format.json { render json: @academic_year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /academic_years/1
  # DELETE /academic_years/1.json
  def destroy
    ensembles = Ensemble.where(academic_year_id: @academic_year.id)
    students = StudentNumber.where(academic_year_id: @academic_year.id)
    @academic_year.destroy
    ensembles.destroy_all
    students.destroy_all
    respond_to do |format|
      format.html { redirect_to academic_years_url, notice: 'Akademska godina i sve veze su obrisane.' }
      format.json { head :no_content }
    end
  end

  def startNewAcademicYear 
    respond_to do |format|
      if AcademicYear.start_new_academic_year == true
        format.html { redirect_to academic_years_url, notice: 'Akademska godina je uspješno kreirana.' }
      else
        format.html { redirect_to academic_years_url, notice: 'Akademska godina ne može biti kreirana jer još uvijek nije počela.' }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_year
      @academic_year = AcademicYear.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_year_params
      params.require(:academic_year).permit(:name, :status)
    end
end
