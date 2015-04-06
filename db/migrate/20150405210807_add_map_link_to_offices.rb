class AddMapLinkToOffices < ActiveRecord::Migration
  def change
    add_column :offices, :map_link, :string
  end
end
