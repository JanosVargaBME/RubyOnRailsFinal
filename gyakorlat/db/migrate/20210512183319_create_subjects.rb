class CreateSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :subjects do |t|
      t.string :name
      t.string :code
      t.string :credit
      t.string :semester
      t.string :type
      t.string :mandatory

      t.timestamps
    end
  end
end
