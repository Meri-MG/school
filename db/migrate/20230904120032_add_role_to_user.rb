# frozen_string_literal: true

class AddRoleToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: true
  end
end
