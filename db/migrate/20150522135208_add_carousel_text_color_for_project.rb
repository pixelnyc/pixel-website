class AddCarouselTextColorForProject < ActiveRecord::Migration
  def change
    add_column :projects, :carousel_text_color, :string, default: 'light'
  end
end
