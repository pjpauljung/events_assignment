class Rsvp < ApplicationRecord
  # Direct associations

  belongs_to :event,
             :counter_cache => :interested_events_count

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
