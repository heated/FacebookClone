class AddAttachmentPicFileToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :pic_file
    end
  end

  def self.down
    drop_attached_file :pictures, :pic_file
  end
end
