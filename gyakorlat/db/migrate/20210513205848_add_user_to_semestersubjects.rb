class AddUserToSemestersubjects < ActiveRecord::Migration[6.1]
  def change
    #add_column :semestersubjects, :user, :string
    #add_column :semestersubjects, :references, :string
    add_reference :semestersubjects, :user, null: true, foreign_key: true#, default: 1
  end
end
