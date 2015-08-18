class WysiwygAttachmentImageUploader < ImageUploader
  version(:main)        { process resize_to_fit: [1600, 900] }
  version(:thumb)       { process resize_to_fill: [150, 150] }
end
