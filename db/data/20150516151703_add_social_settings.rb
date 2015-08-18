class AddSocialSettings < SeedMigration::Migration
  def up
    SiteSetting.create([
      { code: :facebook_link, name: 'Facebook link', value: '#'},
      { code: :twitter_link, name: 'twitter link', value: '#'},
      { code: :instagram_link, name: 'Instagram link', value: '#'},
      { code: :vimeo_link, name: 'Vimeo link', value: '#'},
    ])
  end
end
