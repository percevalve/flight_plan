class AddFlightTimeIdToResas < ActiveRecord::Migration
  def change
    add_column :resas, :flight_time_id, :integer
  end
end
