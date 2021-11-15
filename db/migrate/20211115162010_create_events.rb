class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.datetime :event_start
      t.datetime :event_end
      t.string :location
      t.integer :host
      t.string :details

      t.timestamps
    end
  end
end
