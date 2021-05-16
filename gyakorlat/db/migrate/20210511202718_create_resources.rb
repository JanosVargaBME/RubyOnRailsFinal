class CreateResources < ActiveRecord::Migration[6.1]
  def change
    create_table :resources do |t|
      t.string :name
      t.references :item, null: false, foreign_key: true
      t.string :version

      t.timestamps
    end
  end
end
