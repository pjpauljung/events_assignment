class AddLocationLatitudeToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :location_latitude, :float
  end
end
