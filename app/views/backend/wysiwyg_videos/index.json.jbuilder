json.array! @videos do |video|
  json.id video.id
  json.url video.video.url
end