class RadioButtonsListInput < SimpleForm::Inputs::CollectionRadioButtonsInput
  def input
    @thumb_method = input_html_options.delete(:thumb_method)
    @version = input_html_options.delete(:version)
    @input_method = input_html_options.delete(:input_method) || :radio_button
    collection_string = 'collection_radio_buttons'
    label_method, value_method = detect_collection_methods
    input_options[:item_wrapper_tag] = nil
    template.content_tag :div, class: 'list-wrapper' do
      template.content_tag :div, class: 'row' do
          @builder.send(collection_string,
                        attribute_name, collection, value_method, label_method,
                        input_options, input_html_options,
                        &collection_block_for_nested_boolean_style
          )
      end
    end
  end

  def build_nested_boolean_style_item_tag(collection_builder)
    template.content_tag :div, class: 'col-md-12 gallery-item' do
      input = template.content_tag :td do
        collection_builder.send(@input_method)
      end
      name = template.content_tag :td do
        collection_builder.text
      end
      cover = template.content_tag :div, class: 'thumbnail' do
        img = if @thumb_method && @version
          template.image_tag(collection_builder.object.send(@thumb_method).try(:url, @version))
              end
        caption = template.content_tag :div, class: 'caption' do
          input = template.content_tag :span do
            collection_builder.send(@input_method)
          end
          header = template.content_tag :span, class: 'gallery-title' do
            collection_builder.text
          end

          input + header
        end

        img + caption
      end

      cover
    end
  end

end