# frozen_string_literal: true

class CreateStudentUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :student_updates do |t|
      t.string :season, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :sponsor_student_id, index: true, foreign_key: true

      t.timestamps
    end
  end
end
