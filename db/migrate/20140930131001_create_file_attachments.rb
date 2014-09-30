class CreateFileAttachments < ActiveRecord::Migration
  def up
    create_table :attachments do |t|
      t.timestamps
      t.boolean :main
    end

    add_attachment :attachments, :file
  end

  def down
    drop_table :attachments
  end
end
