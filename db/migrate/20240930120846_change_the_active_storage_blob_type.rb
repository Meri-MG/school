class ChangeTheActiveStorageBlobType < ActiveRecord::Migration[7.2]
  def up
    ActiveStorage::Attachment.where(record_type: 'SponsorStudent').update_all(record_type: 'Student')
  end

  def down
    ActiveStorage::Attachment.where(record_type: 'Student').update_all(record_type: 'SponsorStudent')
  end
end
