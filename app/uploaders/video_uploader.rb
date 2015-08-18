class VideoUploader < BaseUploader
  def extension_white_list
    %w(mp4)
  end
end