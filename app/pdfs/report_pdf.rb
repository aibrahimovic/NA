class ReportPdf < Prawn::Document
  
  def initialize(ensembles, year, subjects)
    super()
    @ensembles = ensembles
    @subjects = subjects
    @academic_year = AcademicYear.find(year)
    
    header
    #text_content
    table_content
  end

  def header
    text "Nastavni ansambl za " + @academic_year.name + " akademsku godinu.", size: 13, style: :bold
    #This inserts an image in the pdf file and sets the size of the image
    #image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
  end

  #def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    #y_position = cursor - 50

    # The bounding_box takes the x and y coordinates for positioning its content and some options to style it
    #bounding_box([0, y_position], :width => 270, :height => 300) do
      #text "Lorem ipsum", size: 15, style: :bold
      #text "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum semper placerat. Aenean mattis fringilla risus ut fermentum. Fusce posuere dictum venenatis. Aliquam id tincidunt ante, eu pretium eros. Sed eget risus a nisl aliquet scelerisque sit amet id nisi. Praesent porta molestie ipsum, ac commodo erat hendrerit nec. Nullam interdum ipsum a quam euismod, at consequat libero bibendum. Nam at nulla fermentum, congue lectus ut, pulvinar nisl. Curabitur consectetur quis libero id laoreet. Fusce dictum metus et orci pretium, vel imperdiet est viverra. Morbi vitae libero in tortor mattis commodo. Ut sodales libero erat, at gravida enim rhoncus ut."
    #end

    #bounding_box([300, y_position], :width => 270, :height => 300) do
      #text "Duis vel", size: 15, style: :bold
      #text "Duis vel tortor elementum, ultrices tortor vel, accumsan dui. Nullam in dolor rutrum, gravida turpis eu, vestibulum lectus. Pellentesque aliquet dignissim justo ut fringilla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Ut venenatis massa non eros venenatis aliquet. Suspendisse potenti. Mauris sed tincidunt mauris, et vulputate risus. Aliquam eget nibh at erat dignissim aliquam non et risus. Fusce mattis neque id diam pulvinar, fermentum luctus enim porttitor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos."
    #end

  #end

  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths

    table ensembles_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [200, 140, 200]
    end
  end

  def ensembles_rows

    [['Predmet', 'Nastavnici']] +

    @subjects.each do |subject_id|
      ensembles = Ensemble.where(subject_id: subject_id).all
      subject = Subject.find(subject_id)
      #[[subject.name]] + 
      
      ensembles.map do |ensemble|
        
        #ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
        ic = Iconv.new('UTF-8', 'WINDOWS-1252')
        ensemble.subject.name = ic.iconv(ensemble.subject.name + ' ')[0..-2]
        ensemble.teacher.first_name = ic.iconv(ensemble.teacher.first_name + ' ')[0..-2]
        ensemble.subject_role.name = ic.iconv(ensemble.subject_role.name + ' ')[0..-2]

        #ensembles.subject.name = ensembles.subject.name.encode('Windows-1252')
        #ensembles.teacher.first_name = ensembles.teacher.first_name.encode('Windows-1252')
        #ensembles.subject_role.name = ensembles.subject_role.name.encode('Windows-1252')

        #ensembles.subject.name.force_encoding( "UTF-8" )
        #ensembles.subject.name.encode( "windows-1252" )

        #ensembles.teacher.first_name.force_encoding( "UTF-8" )
        #ensembles.teacher.first_name.encode( "windows-1252" )

        #ensembles.subject_role.name.force_encoding( "UTF-8" )
        #ensembles.subject_role.name.encode( "windows-1252" )

        #[ensemble.subject.name, ensemble.subject_role.name + ": " + ensemble.teacher.first_name]
       # [[ensemble.subject_role.name + ": " + ensemble.teacher.first_name]]
        
      end
      
      end  
  end
end
