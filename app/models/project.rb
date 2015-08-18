class Project < ActiveRecord::Base
  include Concerns::Sluggable
  include Concerns::Galleryable
  include Concerns::Arrayable

  sluggable :name
  arrayable :services
  enum carousel_text_color: { light: 'light', dark: 'dark' }

  scope :latest,      -> { order('created_at DESC') }
  scope :in_carousel, -> { where(in_carousel: true)  }

  validates_presence_of :name, :tile_cover
  validates_length_of :name, :carousel_title, :link, :maximum => 255
  validates_length_of :description, :carousel_description, maximum: 1000
  validates_length_of :content, maximum: 50_000
  validates :cover, :tile_cover, :carousel_cover, file_size: { maximum: 10.megabytes }
  validates :video, file_size: { maximum: 50.megabytes }

  mount_uploader :tile_cover, ProjectTileCoverUploader
  mount_uploader :carousel_cover, ProjectCarouselCoverUploader
  mount_uploader :cover, ProjectCoverUploader
  mount_uploader :video, VideoUploader
end
