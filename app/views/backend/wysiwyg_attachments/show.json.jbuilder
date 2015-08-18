if @attachment
  json.attachment do
    json.id @attachment.id
    json.thumb @attachment.image.url(:thumb)
    json.url @attachment.image.url(:main)
  end
end