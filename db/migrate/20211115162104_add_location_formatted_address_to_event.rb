class AddLocationFormattedAddressToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :location_formatted_address, :string
  end
end
