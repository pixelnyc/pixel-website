class GalleryPhoto < ActiveRecord::Base
  belongs_to :gallery
  mount_uploader :photo, GalleryPhotoUploader
end
