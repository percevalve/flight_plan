class CreateResas < ActiveRecord::Migration
  def change
    create_table :resas do |t|
      t.string :refresa
      t.datetime :demand
      t.string :duree
      t.integer :paxa
      t.integer :paxe
      t.string :vente
      t.string :nom
      t.string :telephone
      t.string :email
      t.text :observation

      t.timestamps
    end
  end
end
