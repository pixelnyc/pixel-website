class CreateVacancies < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string :position
      t.string :location
      t.string :slug

      t.text :content

      t.timestamps null: false
    end

    add_index :vacancies, :slug
  end
end