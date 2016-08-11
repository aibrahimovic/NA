# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
AcademicYear.create({"name"=>"2000/2001"})
AcademicYear.create({"name"=>"2001/2002"})
AcademicYear.create({"name"=>"2002/2003"})
AcademicYear.create({"name"=>"2003/2004"})
AcademicYear.create({"name"=>"2004/2005"})
AcademicYear.create({"name"=>"2005/2006"})
AcademicYear.create({"name"=>"2006/2007"})
AcademicYear.create({"name"=>"2007/2008"})
AcademicYear.create({"name"=>"2008/2009"})
AcademicYear.create({"name"=>"2009/2010"})	
AcademicYear.create({"name"=>"2010/2011"})	
AcademicYear.create({"name"=>"2011/2012"})	
AcademicYear.create({"name"=>"2012/2013"})	
AcademicYear.create({"name"=>"2013/2014"})	
AcademicYear.create({"name"=>"2014/2015"})	
AcademicYear.create({"name"=>"2015/2016"})	
=end

@subjects = Subject.all
academic_year = AcademicYear.get_current_academic_year

for i in 1...10
	@subjects.each do |subject|
		if subject.study_year == 1
			StudentNumber.create({"subject_id"=>subject.id, "predicted_student_number" => 500, "student_number" => 500, "academic_year_id" => academic_year-i})
		elsif subject.study_year == 2
			StudentNumber.create({"subject_id"=>subject.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => academic_year-i})
		else
			StudentNumber.create({"subject_id"=>subject.id, "predicted_student_number" => 80, "student_number" => 90, "academic_year_id" => academic_year-i})
		end
	end
end

=begin	
	
=begin
s1 = Subject.first
s2 = Subject.last


StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 23})
StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 22})
StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 21})
StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 20})
StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 19})
StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 18})
StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 17})
StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 16})
StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 15})
StudentNumber.create({"subject_id"=>s1.id, "predicted_student_number" => 100, "student_number" => 100, "academic_year_id" => 14})

StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 23})
StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 22})
StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 21})
StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 20})
StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 19})
StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 18})
StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 17})
StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 16})
StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 15})
StudentNumber.create({"subject_id"=>s2.id, "predicted_student_number" => 50, "student_number" => 50, "academic_year_id" => 14})
=end