class ProjectCoverUploader < ImageUploader
  version(:main)            { process resize_to_fit: [1600, 900] }
version(:backend_thumb)   { process resize_to_fill: [100, 100] }
end
