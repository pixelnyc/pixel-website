module Concerns::Arrayable
  extend ActiveSupport::Concern

  module ClassMethods
    def arrayable(field_name)
      attr_accessor "virtual_#{field_name}"
      serialize field_name, Array

      before_validation "set_#{field_name}", on: [:create, :update]

      define_method("set_#{field_name}") do
        if self.send("virtual_#{field_name}").present?
          self.send("#{field_name}=", self.send("virtual_#{field_name}").split("\r\n"))
        end
      end
    end
  end
end