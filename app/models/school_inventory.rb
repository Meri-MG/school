# frozen_string_literal: true

class SchoolInventory < ApplicationRecord
  validates :name, :sponsored, :description, :quantity, presence: true
end
