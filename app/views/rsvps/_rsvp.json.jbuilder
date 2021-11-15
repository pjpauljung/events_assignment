json.extract! rsvp, :id, :user_id, :event_id, :rsvp_selection, :created_at,
              :updated_at
json.url rsvp_url(rsvp, format: :json)
