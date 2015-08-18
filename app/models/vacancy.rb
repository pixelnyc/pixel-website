class Vacancy < ActiveRecord::Base
  include Concerns::Sluggable

  sluggable :position
  enum location: { 'New York' => 'new_york',  'London' => 'london' }

  has_many :applications

  validates_presence_of :position, :location
  validates_length_of :position, maximum: 255
  validates_length_of :content, maximum: 10_000
end
