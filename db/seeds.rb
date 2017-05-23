# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
	users= User.create([{email: 'jeanluc@hotmail.fr'},{name: 'jeanluc'},{teacher: false},{admin: false}])


	disciplines= Discipline.create([{disciplineTitle: 'Maths'},{teacherID: 1}])

	exams=Exam.create([{examTitle: 'TPNoté1'},{disciplineID: 1}])

	assessments=Assessments.create([{examID: 1}, {grade: '10.0'}])


user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email
