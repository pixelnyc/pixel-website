class ArrayInput < SimpleForm::Inputs::TextInput
  def input(wrapper_options = nil)
    real_attribute_name = attribute_name.to_s.gsub('virtual_', '')
    merged_input_options = merge_wrapper_options(input_html_options.merge(value: object.public_send(real_attribute_name).join("\r\n")), wrapper_options)
    @builder.text_area(attribute_name, merged_input_options)
  end
end