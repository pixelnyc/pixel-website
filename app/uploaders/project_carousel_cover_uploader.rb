class ProjectCarouselCoverUploader < ImageUploader
  version(:main)            { process resize_to_fill: [2880, 1760] }
  version(:backend_thumb)   { process resize_to_fill: [100, 100] }
end
