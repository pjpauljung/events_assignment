class CommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :event_id, :integer
  attribute :comment, :string

  # Direct associations

  belongs_to :user

  belongs_to :event

  # Indirect associations

end
