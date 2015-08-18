class AddGalleryToProjects < SeedMigration::Migration
  def up
    Project.all.each do |p|
      p.gallery = Gallery.create
    end
  end
end