# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create name: "user1", email: "user1@test.hu", password: "user1", salt: "qweffs5342", id: 1
User.create name: "user2", email: "user2@test.hu", password: "user2", salt: "qweffs5342", id: 2
User.create name: "user3", email: "user3@test.hu", password: "user3", salt: "qweffs5342", id: 3

Subject.create name: "Prog1", code: "ABC1234", credit: "7", semester: "1", mandatory: "yes", id: 1
Subject.create name: "Prog2", code: "ABC3543", credit: "6", semester: "2", mandatory: "yes", id: 2
Subject.create name: "Prog3", code: "ABC5786", credit: "5", semester: "3", mandatory: "yes", id: 3
Subject.create name: "Prog4", code: "ABC6785", credit: "4", semester: "4", mandatory: "yes", id: 4
Subject.create name: "Math", code: "FGH1234", credit: "4", semester: "1", mandatory: "yes", id: 5
Subject.create name: "Physics", code: "FGH3543", credit: "4", semester: "2", mandatory: "no", id: 6

Semester.create number: 1, credits: 29, average: 4.5, money: "25000", id: 1
Semester.create number: 2, credits: 30, average: 4.1, money: "20000", id: 2
Semester.create number: 3, credits: 32, average: 4.7, money: "30000", id: 3
Semester.create number: 4, credits: 28, average: 4.3, money: "22000", id: 4

Semestersubject.create subject_id: 1, homework: "Done", labor: "10/10", exam: "70%", mark: "4", user_id: 1, id: 1
Semestersubject.create subject_id: 2, homework: "Half Done", labor: "3/10", exam: "50%", mark: "2", user_id: 1, id: 2
Semestersubject.create subject_id: 3, homework: "Done", labor: "10/10", exam: "90%", mark: "5", user_id: 1, id: 3
Semestersubject.create subject_id: 4, homework: "-", labor: "8/10", exam: "70%", mark: "4", user_id: 1, id: 4

Semestersubject.create subject_id: 1, homework: "Done", labor: "10/10", exam: "70%", mark: "4", user_id: 2, id: 5
Semestersubject.create subject_id: 2, homework: "Half Done", labor: "3/10", exam: "50%", mark: "2", user_id: 2, id: 6
Semestersubject.create subject_id: 3, homework: "Done", labor: "10/10", exam: "90%", mark: "5", user_id: 2, id: 7
Semestersubject.create subject_id: 6, homework: "-", labor: "8/10", exam: "70%", mark: "4", user_id: 2, id: 8

Semestersubject.create subject_id: 1, homework: "Done", labor: "10/10", exam: "70%", mark: "4", user_id: 3, id: 9
Semestersubject.create subject_id: 2, homework: "Half Done", labor: "3/10", exam: "50%", mark: "2", user_id: 3, id: 10
Semestersubject.create subject_id: 5, homework: "Done", labor: "10/10", exam: "90%", mark: "5", user_id: 3, id: 11
Semestersubject.create subject_id: 6, homework: "-", labor: "8/10", exam: "70%", mark: "4", user_id: 3, id: 12
