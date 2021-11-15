class EventResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :event_name, :string
  attribute :event_start, :datetime
  attribute :event_end, :datetime
  attribute :location, :string
  attribute :host, :integer
  attribute :details, :string

  # Direct associations

  has_many   :comments

  has_many   :interested_events,
             resource: RsvpResource

  # Indirect associations

end
