json.extract! event, :id, :event_name, :event_start, :event_end, :location, :host, :details, :created_at, :updated_at
json.url event_url(event, format: :json)
