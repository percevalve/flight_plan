class AddStatusToResa < ActiveRecord::Migration
  def change
    add_column :resas, :status, :string
  end
end
