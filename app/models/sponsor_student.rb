# frozen_string_literal: true

# ALC students to sponsor
class SponsorStudent < ApplicationRecord
  has_one_attached :main_image, dependent: :destroy

  has_one_attached :secondary_image, dependent: :destroy

  validates :name, :description, :age, presence: true

  enum sponsored_status: { sponsored: 'sponsored', unsponsored: 'unsponsored' }

  before_create :generate_unique_identifier

  private

  def generate_unique_identifier
    loop do
      length = 6
      self.unique_identifier = SecureRandom.random_number(10**length).to_s.rjust(length, '0')

      break unless SponsorStudent.exists?(unique_identifier: unique_identifier)
    end
  end
end
