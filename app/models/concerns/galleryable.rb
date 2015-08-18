module Concerns; end
module Concerns::Galleryable
  extend ActiveSupport::Concern

  included do
    has_one :gallery, as: :galleryable, dependent: :destroy

    after_create :init_gallery
  end

  protected
  def init_gallery
    Gallery.create(galleryable: self)
  end
end
