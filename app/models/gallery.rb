class Gallery < ActiveRecord::Base
  has_many :gallery_photos, dependent: :destroy
  belongs_to :galleryable, polymorphic: true
end
