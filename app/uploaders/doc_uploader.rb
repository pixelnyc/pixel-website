class DocUploader < BaseUploader
  def extension_white_list
    %w(doc docx pdf rtf txt)
  end
end