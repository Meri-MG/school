# frozen_string_literal: true

# Stores sponsored students fall, winder, spring updates
class StudentUpdate < ApplicationRecord
  has_one_attached :main_image, dependent: :destroy

  has_one_attached :secondary_image, dependent: :destroy

  belongs_to :student

  validates :season, :title, :description, presence: true

  before_save :downcase_season

  private

  def downcase_season
    self.season = season.strip.downcase if season.present?
  end
end
