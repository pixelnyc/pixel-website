class ProjectTileCoverUploader < ImageUploader
  version(:main)            { process resize_to_fill: [600, 600] }
  version(:backend_thumb)   { process resize_to_fill: [100, 100] }
end
