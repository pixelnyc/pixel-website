module BackendHelper
  def paginate_list(collection)
    will_paginate collection, renderer: BootstrapPagination::Rails
  end

  def show_table_item_button(path)
    link_to path, class: 'btn btn-sm btn-default' do
      raw('<i class="ai ai-remove-red-eye"></i>')
    end
  end

  def edit_table_item_button(path)
    link_to path, class: 'btn btn-sm btn-default' do
      raw('<i class="ai ai-mode-edit"></i>')
    end
  end

  def remove_table_item_button(path)
    link_to path, class: 'btn btn-sm btn-default', method: :delete, data: { confirm: 'Do you really want to delete this item?' } do
      raw('<i class="ai ai-delete"></i>')
    end
  end

  def edit_item_button(path)
    link_to path, class: 'btn btn-info' do
      raw('<i class="ai ai-mode-edit"></i>')
    end
  end

  def remove_item_button(path)
    link_to path, class: 'btn btn-danger', method: :delete, data: { confirm: 'Do you really want to delete this item?' } do
      raw('<i class="ai ai-delete"></i>')
    end
  end

  def back_to_list_button(path)
    link_to path, class: 'btn btn-default' do
      raw('<i class="ai ai-keyboard-backspace"></i>')
    end
  end

  def form_buttons(form, cancel_path: nil, submit_label: 'Save')
    content_tag('div', class: 'form-group no-margin btn-group') do
        cancel_button = link_to('Cancel', cancel_path, class: 'btn btn-default btn-lg') if cancel_path
        submit_button = form.button(:submit, submit_label, class: 'btn btn-lg btn-success')

        raw(cancel_button.to_s + submit_button)
    end
  end
end