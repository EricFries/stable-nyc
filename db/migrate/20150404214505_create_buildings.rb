class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|

      t.integer "building_num"
      t.string  "street"
      t.string  "street_suffix"
      t.string  "city"
      t.integer "zip"
      t.integer "block"
      t.integer "lot"
      t.integer "office_id"


      t.timestamps null: false
    end
  end
end
