class AddInterestedEventCountToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :interested_events_count, :integer
  end
end
