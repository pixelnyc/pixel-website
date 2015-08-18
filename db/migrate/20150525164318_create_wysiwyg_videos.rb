class CreateWysiwygVideos < ActiveRecord::Migration
  def change
    create_table :wysiwyg_videos do |t|
      t.string :video

      t.timestamps
    end
  end
end
