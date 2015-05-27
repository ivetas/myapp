class AddAttachmentPhotoToReceipts < ActiveRecord::Migration
  def self.up
    change_table :receipts do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :receipts, :photo
  end
end
