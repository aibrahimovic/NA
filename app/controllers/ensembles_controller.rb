class EnsemblesController < ApplicationController
  before_action :set_ensemble, only: [:show, :edit, :update, :destroy]
  protect_from_forgery
  skip_before_filter :verify_authenticity_token  
  before_filter :confirm_logged_in
  
  # GET /ensembles
  # GET /ensembles.json
  def index
    @ensembles = Ensemble.all

   respond_to do |format|
      
      format.html
      format.pdf do
        pdf = ReportPdf.new(@ensembles) 
        send_data pdf.render, filename: 'NastavniAnsambl.pdf', type: 'application/pdf'
      end
    end
    

  end

  # GET /ensembles/1
  # GET /ensembles/1.json
  def show    
  end



  # GET /ensembles/new
  def new
    academic_year_id = AcademicYear.get_current_academic_year
    academic_year = AcademicYear.find(academic_year_id)
    @ensembles = Ensemble.where(academic_year: academic_year_id)

    @subjects = Subject.all
    @teachers = Teacher.all

    @default_subject_roles = SubjectRole.first(2)
    @subject_roles = SubjectRole.all

    @lecturer = SubjectRole.find_by(name: "Nastavnik")
    @status = academic_year.status

  end

  # GET /ensembles/1/edit
  def edit
  end

  # POST /ensembles
  # POST /ensembles.json
  def create
    @ensemble = Ensemble.new(ensemble_params)

    respond_to do |format|
      if @ensemble.save
        format.html { redirect_to @ensemble, notice: 'Ensemble was successfully created.' }
        format.json { render :show, status: :created, location: @ensemble }
      else
        format.html { render :new }
        format.json { render json: @ensemble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ensembles/1
  # PATCH/PUT /ensembles/1.json
  def update
    respond_to do |format|
      if @ensemble.update(ensemble_params)
        format.html { redirect_to @ensemble, notice: 'Ensemble was successfully updated.' }
        format.json { render :show, status: :ok, location: @ensemble }
      else
        format.html { render :edit }
        format.json { render json: @ensemble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ensembles/1
  # DELETE /ensembles/1.json
  def destroy
    @ensemble.destroy
    respond_to do |format|
      format.html { redirect_to ensembles_url, notice: 'Ensemble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def homePage
    
    @end_teachers = Teacher.where("election_date_end <= ?", Date.today + 7.month)
    @academic_year = AcademicYear.find(AcademicYear.get_current_academic_year)
    if @academic_year.status == 0
      @status = "Nastavni ansambl je u procesu kreiranja."
    elsif @academic_year.status == 1
      @status = "Kreirana je preliminarna verzija nastavnog ansambla."
    else
      @status = "Nastavni ansambl je usvojen."
    end
  end


  def create_record
    status = false
    list = params[:list]
    academic_year = AcademicYear.get_current_academic_year

    #subject_id =params[:subject_id]
    #subject_role_id = params[:subject_role_id]
    #teacher_id = params[:teacher_id]


    list.each do |item|
      subject_id = list[item][:subject_id]
      subject_role_id = list[item][:subject_role_id]
      teacher_id = list[item][:teacher_id]

      current_items = Ensemble.where(subject_id: subject_id, academic_year_id: academic_year).all

      ensemble_item = Ensemble.find_or_initialize_by(subject_id: subject_id, academic_year_id: academic_year, teacher_id: teacher_id, subject_role_id: subject_role_id)
      
      if ensemble_item.created_at.nil?
        ensemble_item.save
        status = true
        return render json: {status: 'OK'}
      end

=begin
      respond_to do |format|
        if status == true
          #format.html { redirect_to ensembles_url, notice: 'Nastavni ansambl za predmet je spašen.' }
          format.json { render json: 'OK' }
        else
          format.html { redirect_to academic_years_url, notice: 'Desila se greška prilikom spašavanja nastavnog ansambla za ovaj predmet.' }
        end
      end
=end

      #current_items.each do |current_item|
      
        #if current_item.subject_role_id.to_i == subject_role_id.to_i

          #current_item.teacher_id = teacher_id
          #current_item.save
          #return render json: { status: 'Teacher updated.' }
        
        #elsif current_item.teacher_id.to_i == teacher_id.to_i
         # current_item.subject_role_id = subject_role_id
         # current_item.save
         # return render json: { status: 'Subject role updated.' }
        
       # end

      #end

      #Ensemble.create(subject_id: subject_id, subject_role_id: subject_role_id, teacher_id: teacher_id, academic_year_id: academic_year)
     # return render json: { status: 'New record saved.' }
         
      

    end 
    

  end

  def delete_record 
    subject_id = params[:subject_id]
    teacher_id = params[:teacher_id]
    subject_role_id = params[:subject_role_id]

    academic_year = AcademicYear.get_current_academic_year

    ensemble_item = Ensemble.where(academic_year_id: academic_year, subject_id: subject_id, teacher_id: teacher_id, subject_role_id: subject_role_id)
    teacher = Teacher.find(teacher_id)
    teacher = teacher.first_name + " " + teacher.last_name
    subject = Subject.find(subject_id).name
    ensemble_item.destroy_all
    respond_to do |format|
      format.html { redirect_to new_ensemble_path, notice: 'Nastavnik '+ teacher +' je obrisan/a sa predmeta '+subject}
      format.json { head :no_content }
    end

  end

  def saveFirstVersion
    a_year = AcademicYear.get_current_academic_year
    @covered_subjects = Ensemble.where(academic_year_id: a_year).uniq.pluck(:subject_id)
    
    #@uncovered_subjects = Subject.where("id NOT IN (?)", @covered_subjects)

    subjects_test = Subject.all.limit(17)
    @uncovered_subjects = subjects_test.where("id NOT IN (?)", @covered_subjects)

    respond_to do |format|
      if @uncovered_subjects.nil? || @uncovered_subjects == []
        current_year = AcademicYear.find(a_year) 
        current_year.status = 1
        current_year.save
        format.html { redirect_to new_ensemble_path, notice: 'Preliminarna verzija je poslana'}
        format.json { head :no_content }
      else
        format.html { redirect_to new_ensemble_path, notice: 'Da biste poslali preliminarnu verziju potrebno je spasiti sve predmete.'}
        format.json { head :no_content }
      end
    end
  end

  def saveFinalVersion
    a_year = AcademicYear.get_current_academic_year
    @covered_subjects = Ensemble.where(academic_year_id: a_year).uniq.pluck(:subject_id)
    
    #@uncovered_subjects = Subject.where("id NOT IN (?)", @covered_subjects)

    subjects_test = Subject.all.limit(17)
    @uncovered_subjects = subjects_test.where("id NOT IN (?)", @covered_subjects)

    respond_to do |format|
      if @uncovered_subjects.nil? || @uncovered_subjects == []
        current_year = AcademicYear.find(a_year) 
        current_year.status = 2
        current_year.save
        format.html { redirect_to new_ensemble_path, notice: 'Finalna verzija je spašena'}
        format.json { head :no_content }
      else
        format.html { redirect_to new_ensemble_path, notice: 'Da biste poslali preliminarnu verziju potrebno je spasiti sve predmete.'}
        format.json { head :no_content }
      end
    end

  end

  def documents
    @teacher = Teacher.all
  end

  #Dokument - Nastavni ansambl za x akademsku godinu
  def downloadEnsemble
    academic_year_id = AcademicYear.get_current_academic_year
    @academic_year = AcademicYear.find(academic_year_id)
    @ensembles = Ensemble.where(academic_year: academic_year_id)

    @ensembles = Ensemble.where(academic_year: academic_year_id).group_by(&:subject)
    set_document_rendering(true)
  end

  #Dokument - Rješenje o radnim zadacim nastavnika
  def teacherTasks 
    @teacher = Teacher.first
    a_year = AcademicYear.get_current_academic_year

    @teachers_subject_ids = Ensemble.where(teacher_id: @teacher.id, academic_year_id: a_year).uniq.pluck(:subject_id)

    @teachers_subjects = Subject.where("id IN (?)", @teachers_subject_ids)
    
    
=begin
    @teachers = Teacher.all
    #@teachers.each do |teacher|

    teacher = @teachers.first
    respond_with @teachers do |wants|
      wants.html {
        if request.env["Rack-Middleware-PDFKit"]
          pdf_page = PDFKit.new(teacherTasks_ensembles_path).to_pdf :layout => "print_out"
          send_data pdf_page, :filename => "file.pdf"
        else
          render :layout => "print_out"
        end
      }
    end 
    #end
=end
  end


  #Statistika - Izvještaj o nepokrivenim predmetima
  def uncoveredSubjects
    @covered_subjects = Ensemble.uniq.pluck(:subject_id)
    @uncoveredSubjects = Subject.where("id NOT IN (?)", @covered_subjects)
    @academic_year = AcademicYear.find (AcademicYear.get_current_academic_year)
    set_document_rendering(true)
  end

  #Statistika - Izvještaj o normama nastavnika
  def teachersNorm
    @teachers = Teacher.all

    professor_norm = Constant.professor_norm[:lectures]
    assistent_norm = Constant.assistent_norm[:tutorials]
    academic_year = AcademicYear.get_current_academic_year

    @more_l = []
    @less_l = []
    @optimal_l = []

    @more_e = []
    @less_e = []
    @optimal_e = []

    @teachers.each do |teacher|

      count_hours_l = 0
      count_hours_e = 0
      @ensembles = Ensemble.where(teacher_id: teacher.id, academic_year: academic_year)

      @ensembles.each do |item|
        subject = Subject.find(item.subject_id)
        if item.subject_role.name == "Nastavnik" 
          count_hours_l += subject.number_of_lectures
        else
          count_hours_e += subject.number_of_tutorials + subject.number_of_exercises + subject.number_of_special_activities
        end
      end

      if count_hours_l != 0
        if count_hours_l > professor_norm[1]
          @more_l << {teacher: Teacher.find(teacher.id), counter: count_hours_l}
        elsif count_hours_l > professor_norm[0] && count_hours_l < professor_norm[1]
          @optimal_l << {teacher: Teacher.find(teacher.id), counter: count_hours_l}
        else
          @less_l << {teacher: Teacher.find(teacher.id), counter: count_hours_l}
        end
      end

      if count_hours_e != 0
        if count_hours_e > assistent_norm
          @more_e << {teacher: Teacher.find(teacher.id), counter: count_hours_e}
        elsif count_hours_e == assistent_norm
          @optimal_e << {teacher: Teacher.find(teacher.id), counter: count_hours_e}
        else
          @less_e << {teacher: Teacher.find(teacher.id), counter: count_hours_e}
        end
      end
          
    end
    
  end

  def getCurrentEnsemble
    academic_year = AcademicYear.get_current_academic_year
    ensemble = Ensemble.where(academic_year: academic_year)
    ensemble.order(subject_id: :asc)
    respond_to do |format|
      format.json { render :json => ensemble } 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ensemble
      @ensemble = Ensemble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ensemble_params
      params.require(:ensemble).permit(:subject_id, :teacher_id, :academic_year)
    end
end
