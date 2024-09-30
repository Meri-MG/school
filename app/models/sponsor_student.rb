# frozen_string_literal: true

# ALC students
class SponsorStudent < ApplicationRecord
  has_one_attached :main_image, dependent: :destroy

  has_one_attached :secondary_image, dependent: :destroy

  has_many :student_updates, foreign_key: :sponsor_student_id


  validates :name, :description, :age, presence: true

  enum status: { sponsored: 'sponsored', unsponsored: 'unsponsored' }

  before_save :generate_unique_identifier

  def generate_unique_identifier
    loop do
      length = 6
      self.unique_identifier = SecureRandom.random_number(10**length).to_s.rjust(length, '0')

      break unless SponsorStudent.exists?(unique_identifier: unique_identifier)
    end
  end
end
