class GalleryPhotoUploader < ImageUploader
  version(:main)        { process resize_to_fill: [1600, 900] }
  version(:thumb)       { process resize_to_fill: [200, 200] }
end