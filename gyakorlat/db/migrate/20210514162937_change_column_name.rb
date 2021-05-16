class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :subjects, :type, :tipus
  end
end
