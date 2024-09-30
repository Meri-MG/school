class ChangeAdminDefaultToFalse < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :admin, from: true, to: false
    rename_column :sponsor_students, :sponsored_status, :status
  end
end
