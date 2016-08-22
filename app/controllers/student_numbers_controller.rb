class StudentNumbersController < ApplicationController
  before_action :set_student_number, only: [:show, :edit, :update, :destroy]
  before_filter :confirm_logged_in

  # GET /student_numbers
  # GET /student_numbers.json
  @test = [] 

  def index
    @student_numbers = StudentNumber.all
    @student_numbers = @student_numbers.sort_by {|obj| -obj.academic_year_id}
    
    academic_year_id = AcademicYear.get_current_academic_year
    @academic_year = AcademicYear.find(academic_year_id)
    #StudentNumber.predict_student_number
  end

  # GET /student_numbers/1
  # GET /student_numbers/1.json
  def show
  end

  # GET /student_numbers/new
  def new
    @student_number = StudentNumber.new
  end

  # GET /student_numbers/1/edit
  def edit
  end

  # POST /student_numbers
  # POST /student_numbers.json
  # Need to pull number of students on all subjects in last 10 years
  def create
    @student_number = StudentNumber.new(student_number_params)

    respond_to do |format|
      if @student_number.save
        format.html { redirect_to student_numbers_url, notice: 'Broj studenata je uspješno kreiran.' }
        format.json { render :show, status: :created, location: @student_number }
      else
        format.html { render :new }
        format.json { render json: @student_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_numbers/1
  # PATCH/PUT /student_numbers/1.json
  def update
    respond_to do |format|
      if @student_number.update(student_number_params)
        format.html { redirect_to student_numbers_url, notice: 'Broj studenata je uspješno izmjenjen.' }
        format.json { render :show, status: :ok, location: @student_number }
      else
        format.html { render :edit }
        format.json { render json: @student_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_numbers/1
  # DELETE /student_numbers/1.json
  def destroy
    @student_number.destroy
    respond_to do |format|
      format.html { redirect_to student_numbers_url, notice: 'Broj studenata je uspješno obrisan.' }
      format.json { head :no_content }
    end
  end

  def predictStudentNumber
    status = StudentNumber.predict_student_number
    if status == false
      respond_to do |format|
        format.html { redirect_to student_numbers_url, notice: 'Za trenutnu akademsku godinu već je projiciran broj studenata.'}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to student_numbers_url, notice: 'Broj studenata je uspješno projiciran'}
        format.json { head :no_content }
      end
    end
  end

  def updateStudentNumber
    status = StudentNumber.update_student_number
    if status == false
      respond_to do |format|
        format.html { redirect_to student_numbers_url, notice: 'Svi predmeti imaju spašen stvarni broj studenata.'}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to student_numbers_url, notice: 'Broj studenata je uspješno ažuriran'}
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_number
      @student_number = StudentNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_number_params
      params.require(:student_number).permit(:subject_id, :predicted_student_number, :student_number, :academic_year)
    end

end
