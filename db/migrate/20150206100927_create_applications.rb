class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :email
      t.integer :vacancy_id
      t.string :portfolio_url
      t.string :location

      t.string :first_name
      t.string :last_name

      t.string :phone
      t.string :linkedin_url
      t.string :website

      t.string :resume
      t.string :cover_letter

      t.timestamps null: false
    end
  end
end
