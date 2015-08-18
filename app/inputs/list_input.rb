class ListInput < SimpleForm::Inputs::CollectionCheckBoxesInput

  def input
    label_method, value_method = detect_collection_methods
    input_options[:item_wrapper_tag] = nil
    template.content_tag :div, class: 'list-wrapper' do
      template.content_tag :table, class: 'table table-advanced table-gallery' do
        template.content_tag :tbody do
          @builder.send("collection_check_boxes",
                        attribute_name, collection, value_method, label_method,
                        input_options, input_html_options,
                        &collection_block_for_nested_boolean_style
          )
        end
      end
    end
  end

  def build_nested_boolean_style_item_tag(collection_builder)
    template.content_tag :tr do
      path = template.edit_polymorphic_path([:backend, collection_builder.object])
      checkbox = template.content_tag :td, class: 'w-30' do
        collection_builder.check_box
      end
      name = template.content_tag :td do
        template.link_to collection_builder.text, path, target: '_blank'
      end

      link = template.content_tag :td do
        template.link_to path, target: '_blank' do
          template.raw("<i class='ai ai-mode-edit'>")
        end
      end
      checkbox + name + link
    end
  end
end