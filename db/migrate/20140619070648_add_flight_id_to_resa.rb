class AddFlightIdToResa < ActiveRecord::Migration
  def change
    add_column :resas, :flight_id, :integer
  end
end
