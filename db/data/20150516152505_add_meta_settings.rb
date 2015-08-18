class AddMetaSettings < SeedMigration::Migration
  def up
    SiteSetting.create([
      { code: :meta_keywords, name: 'Meta keywords', value: '#'},
      { code: :meta_description, name: 'Meta description', value: '#'},
    ])
  end
end
