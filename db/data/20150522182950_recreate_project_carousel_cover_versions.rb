class RecreateProjectCarouselCoverVersions < SeedMigration::Migration
  def up
    Project.all.each { |p| p.carousel_cover.recreate_versions!(:main) if p.carousel_cover.present? }
  end
end
