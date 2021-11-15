class AddLocationLongitudeToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :location_longitude, :float
  end
end
