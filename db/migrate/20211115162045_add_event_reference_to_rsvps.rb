class AddEventReferenceToRsvps < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rsvps, :events
    add_index :rsvps, :event_id
    change_column_null :rsvps, :event_id, false
  end
end
