class WysiwygVideo < ActiveRecord::Base
  mount_uploader :video, VideoUploader

  validates_presence_of :video
end