json.array!(@photographers) do |photographer|
  json.extract! photographer, :id, :name, :email
  json.url photographer_url(photographer, format: :json)
end
