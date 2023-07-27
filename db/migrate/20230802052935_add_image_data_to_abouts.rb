class AddImageDataToAbouts < ActiveRecord::Migration[7.0]
  def change
    add_column :abouts, :image_data, :text
  end
end
