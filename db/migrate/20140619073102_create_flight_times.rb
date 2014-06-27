class CreateFlightTimes < ActiveRecord::Migration
  def change
    create_table :flight_times do |t|
      t.string :flight
      t.time :time

      t.timestamps
    end
  end
end
