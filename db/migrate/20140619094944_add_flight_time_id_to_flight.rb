class AddFlightTimeIdToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :flight_time_id, :integer
  end
end
