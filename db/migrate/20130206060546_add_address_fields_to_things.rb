class AddAddressFieldsToThings < ActiveRecord::Migration
  def change
    add_column :things, :address, :string
    add_column :things, :city, :string
    add_column :things, :state, :string
    add_column :things, :postal_code, :string
    add_column :things, :country, :string
  end
end
