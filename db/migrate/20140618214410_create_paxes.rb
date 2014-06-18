class CreatePaxes < ActiveRecord::Migration
  def change
    create_table :paxes do |t|
      t.string :nom
      t.string :prenom
      t.string :lieu_de_naissance
      t.date :date_de_naissance
      t.boolean :adulte
      t.boolean :enfant
      t.text :observations
      t.integer :flight_id
      t.integer :resa_id

      t.timestamps
    end
  end
end
