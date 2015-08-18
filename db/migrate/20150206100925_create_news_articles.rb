class CreateNewsArticles < ActiveRecord::Migration
  def change
    create_table :news_articles do |t|
      t.string :title
      t.string :slug

      t.string :cover
      t.string :author

      t.text :readout
      t.text :content

      t.boolean :published, default: true

      t.timestamps null: false
    end
  end
end
