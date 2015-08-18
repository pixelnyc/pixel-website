class NewsArticle < ActiveRecord::Base
  include Concerns::Sluggable

  sluggable :title
  scope :latest,    -> { order('updated_at DESC') }
  scope :published, -> { where(published: true)  }

  mount_uploader :cover, NewsArticleCoverUploader

  validates_presence_of :title, :content, :author
  validates_length_of :author, maximum: 31
  validates_length_of :title, maximum: 255
  validates_length_of :readout, maximum: 1_500
  validates_length_of :content, maximum: 50_000
end