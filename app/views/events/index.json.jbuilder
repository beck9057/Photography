json.array!(@events) do |event|
  json.extract! event, :id, :client_id, :title, :kind, :description, :date
  json.url event_url(event, format: :json)
end
