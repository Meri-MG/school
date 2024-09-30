# frozen_string_literal: true

class ChangeTheActiveStorageBlobType < ActiveRecord::Migration[7.2]
  def up
    ActiveStorage::Attachment.where(record_type: 'SponsorStudent').update_all(record_type: 'Student') # rubocop:disable Rails/SkipsModelValidations
  end

  def down
    ActiveStorage::Attachment.where(record_type: 'Student').update_all(record_type: 'SponsorStudent') # rubocop:disable Rails/SkipsModelValidations
  end
end
