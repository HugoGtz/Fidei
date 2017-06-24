class AddAttachmentAvatarToPayments < ActiveRecord::Migration
  def self.up
    change_table :payments do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :payments, :avatar
  end
end
