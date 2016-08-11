require 'csv' 

class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]



  # GET /subjects
  # GET /subjects.json
  def index
    @subjects = Subject.all
  end

  # GET /subjects/1
  # GET /subjects/1.json
  def show
  end

  # GET /subjects/new
  def new
    @subject = Subject.new
    @study_program = Constant.study_program
  end

  # GET /subjects/1/edit
  def edit
  end

  # POST /subjects
  # POST /subjects.json
  def create
    @subject = Subject.new(subject_params)

    @subject.study_program = Subject.getStudyProgram(@subject.department.name, @subject.study_cicle)
    if @subject.number_of_lectures.nil? || @subject.number_of_lectures < 0
      @subject.number_of_lectures = 0
    end
    if @subject.number_of_exercises.nil? || @subject.number_of_exercises < 0
      @subject.number_of_exercises = 0
    end
    if @subject.number_of_tutorials.nil? || @subject.number_of_tutorials < 0
      @subject.number_of_tutorials = 0
    end
    if @subject.number_of_special_activities.nil? || @subject.number_of_special_activities < 0
      @subject.number_of_special_activities = 0
    end   
        
    @subject.save
    
    respond_to do |format|
      if @subject.save
        format.html { redirect_to subjects_url, notice: 'Predmet je uspješno kreiran.' }
        format.json { render :show, status: :created, location: @subject }
      else
        format.html { render :new }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subjects/1
  # PATCH/PUT /subjects/1.json
  def update
    respond_to do |format|
      if @subject.update(subject_params)
        format.html { redirect_to subjects_url, notice: 'Predmet je uspješno izmjenjen.' }
        format.json { render :show, status: :ok, location: @subject }
      else
        format.html { render :edit }
        format.json { render json: @subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subjects/1
  # DELETE /subjects/1.json
  def destroy
    @subject.destroy
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Predmet je uspješno obrisan.' }
      format.json { head :no_content }
    end
  end

  def import_subjects
    ###import predmeta iz csv fajla
    csv_text = File.read('/home/azra/Desktop/Predmeti.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      row = row.to_hash
      if Subject.find_by(code: row['code']).nil?
        subject = Subject.create!(row.to_hash)
      end

    end
    respond_to do |format|
      format.html { redirect_to subjects_url, notice: 'Predmeti su uspješno učitani.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_params
      params.require(:subject).permit(:code, :name, :number_of_lectures, :number_of_exercises, :number_of_tutorials, :number_of_special_activities, :study_program, :study_cicle, :department_id, :study_year, :semestar)
    end
end
