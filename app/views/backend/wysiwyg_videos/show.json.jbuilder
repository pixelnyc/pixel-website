if @video
  json.video do
    json.id @video.id
    json.url @video.video.url
  end
end