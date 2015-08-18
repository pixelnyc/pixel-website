class AddAdditionalFieldsToProject < ActiveRecord::Migration
  def change
    add_column :projects, :cover, :string
    add_column :projects, :video, :string
    add_column :projects, :services, :text
  end
end
