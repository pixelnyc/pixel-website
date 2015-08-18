module Concerns; end;
module Concerns::Sluggable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId

    friendly_id :generated_slug, use: :slugged
  end

  module ClassMethods
    def sluggable(field_name)
      define_method(:slug_source) do
        self.send(field_name)
      end
    end
  end

  def generated_slug
    translated_title = slug_source.dup if slug_source.present?
    [ translated_title, [translated_title, SecureRandom.random_number(1000)]]
  end

  def slug=(value)
    if value.present?
      write_attribute(:slug, value)
    end
  end
end
