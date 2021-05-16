class CreateSemesters < ActiveRecord::Migration[6.1]
  def change
    create_table :semesters do |t|
      t.integer :number
      t.integer :credits
      t.float :average
      t.string :money

      t.timestamps
    end
  end
end
