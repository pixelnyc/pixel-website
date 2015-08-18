class ImageUploader < BaseUploader

  def extension_white_list
    %w(jpg jpeg png gif)
  end
end