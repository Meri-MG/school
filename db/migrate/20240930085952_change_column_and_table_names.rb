# frozen_string_literal: true

class ChangeColumnAndTableNames < ActiveRecord::Migration[7.2]
  def change
    change_column_default :users, :admin, from: true, to: false
    rename_column :sponsor_students, :sponsored_status, :status
    rename_table :sponsor_students, :students
    rename_column :student_updates, :sponsor_student_id, :student_id
  end
end
