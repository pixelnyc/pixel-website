class AddCarouselFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :carousel_title, :string
    add_column :projects, :carousel_description, :text
  end
end
