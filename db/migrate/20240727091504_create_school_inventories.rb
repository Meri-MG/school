class CreateSchoolInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :school_inventories do |t|
      t.string :name, null: false
      t.integer :quantity, null: false
      t.text :description, null: false
      t.boolean :sponsored, null: false, default: false

      t.timestamps
    end
  end
end
