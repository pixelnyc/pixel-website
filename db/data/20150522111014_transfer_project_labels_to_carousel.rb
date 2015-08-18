class TransferProjectLabelsToCarousel < SeedMigration::Migration
  def up
    Project.all.each do |project|
      project.update_attributes({carousel_title: project.name,
                                 carousel_description: project.description})
    end
  end
end
