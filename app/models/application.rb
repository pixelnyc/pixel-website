class Application < ActiveRecord::Base
  validates_presence_of :first_name, :last_name, :email

  validates :resume, :cover_letter, file_size: { maximum: 10.megabytes }

  mount_uploader :resume, DocUploader
  mount_uploader :cover_letter, DocUploader

  #belongs_to :vacancy
end