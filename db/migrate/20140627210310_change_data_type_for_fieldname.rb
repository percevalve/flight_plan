class ChangeDataTypeForFieldname < ActiveRecord::Migration
  def self.up
    change_table :resas do |t|
      t.change :demand, :date
    end
  end
  def self.down
    change_table :resas do |t|
      t.change :demand, :datetime
    end
  end
end
