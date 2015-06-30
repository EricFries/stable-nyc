class ChangeBuildingsColumns < ActiveRecord::Migration
  def change
    change_column :buildings, :zip, :string
    change_column :buildings, :building_num, :string
  end
end
