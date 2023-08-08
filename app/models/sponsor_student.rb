class SponsorStudent < ApplicationRecord
  has_one_attached :main_image do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_one_attached :secondary_image

  validates :name, :description, :age, presence: true

  enum sponsored_status: { sponsored: 'sponsored', unsponsored: 'unsponsored' }

  before_create :generate_unique_identifier

  private

  def generate_unique_identifier
    loop do
      length = 6
      self.unique_identifier = SecureRandom.random_number(10**6).to_s.rjust(6, '0')

      break unless SponsorStudent.exists?(unique_identifier: unique_identifier)
    end
  end
end
