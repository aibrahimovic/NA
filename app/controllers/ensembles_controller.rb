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
    academic_year = AcademicYear.get_current_academic_year
    @ensembles = Ensemble.where(academic_year: academic_year)

    @subjects = Subject.all.limit(10)
    @teachers = Teacher.all

    @default_subject_roles = SubjectRole.first(2)
    @subject_roles = SubjectRole.all

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


=begin
     respond_to do |format|
        format.html
        format.pdf do
          subjects = @ensembles.uniq.pluck(:subject_id)
          pdf = ReportPdf.new(@ensembles, academic_year, subjects) 
          send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
        end
      end
=end
  end

  #Dokument - Rješenje o radnim zadacim nastavnika
  def teacherTasks 
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

  end

  def statistics
  end

  #Statistika - Izvještaj o nepokrivenim predmetima
  def uncoveredSubjects
    @covered_subjects = Ensemble.uniq.pluck(:subject_id)
    @uncoveredSubjects = Subject.where("id NOT IN (?)", @covered_subjects)
    @academic_year = AcademicYear.find (AcademicYear.get_current_academic_year)
    set_document_rendering(true)
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
