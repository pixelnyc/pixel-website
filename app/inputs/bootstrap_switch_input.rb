class BootstrapSwitchInput < SimpleForm::Inputs::Base
  def input
    hidden_field = @builder.hidden_field(attribute_name, value: 0)
    check_box = @builder.check_box(attribute_name, {}, 1, nil)

    hidden_field + check_box
  end
end