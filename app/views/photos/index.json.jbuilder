json.array!(@photos) do |photo|
  json.extract! photo, :id, :photographer_id, :event_id, :url
  json.url photo_url(photo, format: :json)
end
