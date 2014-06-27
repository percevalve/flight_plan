class AddHeureDemandToResa < ActiveRecord::Migration
  def change
    add_column :resas, :heure_demand, :string
  end
end
