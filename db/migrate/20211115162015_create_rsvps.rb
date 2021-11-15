class CreateRsvps < ActiveRecord::Migration[6.0]
  def change
    create_table :rsvps do |t|
      t.integer :user_id
      t.integer :event_id
      t.string :rsvp_selection

      t.timestamps
    end
  end
end
