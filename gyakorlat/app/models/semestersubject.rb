class Semestersubject < ApplicationRecord
  belongs_to :user
  belongs_to :subject
end
