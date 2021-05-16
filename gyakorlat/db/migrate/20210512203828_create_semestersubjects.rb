class CreateSemestersubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :semestersubjects do |t|
      t.references :subject, null: false, foreign_key: true
      t.string :homework
      t.string :labor
      t.string :exam
      t.string :mark

      t.timestamps
    end
  end
end
