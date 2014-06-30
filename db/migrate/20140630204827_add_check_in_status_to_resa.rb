class AddCheckInStatusToResa < ActiveRecord::Migration
  def change
    add_column :resas, :check_in_status, :string
  end
end
