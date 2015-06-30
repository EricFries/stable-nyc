class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string  "name"
      t.integer "building_num"
      t.string  "street"
      t.string  "street_suffix"
      t.string  "city"
      t.integer "zip"
      t.string  "phone_num"
      t.string  "internal_address"
      t.timestamps null: false
    end
  end
end
