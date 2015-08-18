class CreateWysiwygAttachments < ActiveRecord::Migration
  def change
    create_table :wysiwyg_attachments do |t|
      t.string :image

      t.timestamps
    end
  end
end
