class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string  "status1"
      t.string  "status2"
      t.string  "status3"
      t.integer "building_id"
      t.timestamps null: false
    end
  end
end
