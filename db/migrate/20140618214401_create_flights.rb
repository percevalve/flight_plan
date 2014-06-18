class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :flight_ref
      t.date :flight_date
      t.time :time_tk_off
      t.string :flight_name
      t.integer :pax_blocked
      t.integer :seats
      t.string :flight_status
      t.text :remark

      t.timestamps
    end
  end
end
