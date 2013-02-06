class AddStreetAddressToThings < ActiveRecord::Migration
  def change
    add_column :things, :street_address, :string
  end
end
