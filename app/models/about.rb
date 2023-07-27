class About < ApplicationRecord
  include ImageUploader::Attachment(:image)
  validates :title, :content, presence: true
end
