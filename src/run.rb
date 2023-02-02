require "./src/class.rb"
require "./src/student.rb"

classroom = Classroom.new("Class 7")

student = Student.new(classroom)
puts student.classroom.label
puts classroom.students.classroom