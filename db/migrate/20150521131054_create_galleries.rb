class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer  :galleryable_id
      t.string   :galleryable_type

      t.timestamps
    end

    add_index :galleries, [:galleryable_id, :galleryable_type]
    create_table :gallery_photos do |t|
      t.string   :photo
      t.integer  :gallery_id

      t.timestamps
    end
    add_index :gallery_photos, :gallery_id
  end
end
