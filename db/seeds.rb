# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

=begin
AcademicYear.create({"name"=>"2000/2001", status=2})
AcademicYear.create({"name"=>"2001/2002", status=2})
AcademicYear.create({"name"=>"2002/2003", status=2})
AcademicYear.create({"name"=>"2003/2004", status=2})
AcademicYear.create({"name"=>"2004/2005", status=2})
AcademicYear.create({"name"=>"2005/2006", status=2})
AcademicYear.create({"name"=>"2006/2007", status=2})
AcademicYear.create({"name"=>"2007/2008", status=2})
AcademicYear.create({"name"=>"2008/2009", status=2})
AcademicYear.create({"name"=>"2009/2010", status=2})	
AcademicYear.create({"name"=>"2010/2011", status=2})	
AcademicYear.create({"name"=>"2011/2012", status=2})	
AcademicYear.create({"name"=>"2012/2013", status=2})	
AcademicYear.create({"name"=>"2013/2014", status=2})	
AcademicYear.create({"name"=>"2014/2015", status=2})	
AcademicYear.create({"name"=>"2015/2016", status=2})	
=end

=begin StudentNumber table
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
=end

=begin roles, privileges and role_privileges

p1 = Privilege.create(name: 'Upravljanje nastavnicima')
p2 = Privilege.create(name: 'Upravljanje predmetima')
p3 = Privilege.create(name: 'Nastavni ansambl')
p4 = Privilege.create(name: 'Statistika')
p5 = Privilege.create(name: 'Rješenje o radnim zadacima')
p6 = Privilege.create(name: 'Obrazac nastavnog ansambla')
p7 = Privilege.create(name: 'Korisnički nalozi')
p8 = Privilege.create(name: 'Broj studenata')

r1 = Role.create(name: 'Odsjek')
r2 = Role.create(name: 'Služba za personalne poslove')
r3 = Role.create(name: 'Uprava')
r4 = Role.create(name: 'Administrator')

#Odsjek
RolePrivilege.create(role_id: r1.id, privilege_id: p1.id)
RolePrivilege.create(role_id: r1.id, privilege_id: p2.id)
RolePrivilege.create(role_id: r1.id, privilege_id: p3.id)
RolePrivilege.create(role_id: r1.id, privilege_id: p4.id)
RolePrivilege.create(role_id: r1.id, privilege_id: p8.id)

#Služba za personalne poslove
RolePrivilege.create(role_id: r2.id, privilege_id: p5.id)

#Uprava
RolePrivilege.create(role_id: r3.id, privilege_id: p4.id)
RolePrivilege.create(role_id: r3.id, privilege_id: p5.id)
RolePrivilege.create(role_id: r3.id, privilege_id: p6.id)

#Administrator
RolePrivilege.create(role_id: r4.id, privilege_id: p1.id)
RolePrivilege.create(role_id: r4.id, privilege_id: p2.id)
RolePrivilege.create(role_id: r4.id, privilege_id: p3.id)
RolePrivilege.create(role_id: r4.id, privilege_id: p4.id)
RolePrivilege.create(role_id: r4.id, privilege_id: p5.id)
RolePrivilege.create(role_id: r4.id, privilege_id: p6.id)
RolePrivilege.create(role_id: r4.id, privilege_id: p7.id)
RolePrivilege.create(role_id: r4.id, privilege_id: p8.id)

=end