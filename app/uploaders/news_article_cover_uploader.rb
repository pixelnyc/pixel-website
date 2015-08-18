class NewsArticleCoverUploader < ImageUploader
  version(:main)            { process resize_to_fill: [960, 640] }
  version(:backend_thumb)   { process resize_to_fill: [100, 100] }
end
