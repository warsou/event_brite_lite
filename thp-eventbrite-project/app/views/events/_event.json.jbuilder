json.extract! event, :id, :title, :start_date, :duration, :description, :price, :location, :created_at, :updated_at
json.url event_url(event, format: :json)
