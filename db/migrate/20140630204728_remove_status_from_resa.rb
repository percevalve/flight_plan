class RemoveStatusFromResa < ActiveRecord::Migration
  def change
    remove_column :resas, :status, :string
  end
end
