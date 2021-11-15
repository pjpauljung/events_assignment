class Comment < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :event,
             counter_cache: true

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
