class WysiwygAttachment < ActiveRecord::Base
  mount_uploader :image, WysiwygAttachmentImageUploader

  validates_presence_of :image
end