json.array! @photos do |photo|
  json.thumbUrl photo.photo.url(:thumb)
  json.id photo.id
end