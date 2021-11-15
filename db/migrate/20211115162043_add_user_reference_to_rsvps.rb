class AddUserReferenceToRsvps < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :rsvps, :users
    add_index :rsvps, :user_id
    change_column_null :rsvps, :user_id, false
  end
end
