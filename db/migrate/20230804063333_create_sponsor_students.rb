class CreateSponsorStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :sponsor_students do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :grade
      t.string :sponsored_status
      t.integer :age, null: false
      t.string :fav_food
      t.string :fav_color
      t.string :hobbies
      t.string :unique_identifier, index: true, null: false

      t.timestamps
    end
  end
end
