class Event < ApplicationRecord
  # Direct associations

  has_many   :interested_events,
             :class_name => "Rsvp",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    event_name
  end

end
