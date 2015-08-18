class AddAppNameSiteSetting < SeedMigration::Migration
  def up
    SiteSetting.create(code: :app_name, name: 'Site name', value: 'Pixel')
  end
end
