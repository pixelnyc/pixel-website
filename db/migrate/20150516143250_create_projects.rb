class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.text :content
      t.string :tile_cover
      t.string :carousel_cover
      t.boolean :in_carousel

      t.timestamps null: false
    end
  end
end
