class AddInterestedEventCountToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :interested_events_count, :integer
  end
end
