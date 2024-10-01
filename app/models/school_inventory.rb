# frozen_string_literal: true

# school invetory
class SchoolInventory < ApplicationRecord
  validates :name, :sponsored, :description, :quantity, presence: true
end
