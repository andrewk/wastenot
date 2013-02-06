class CreateThings < ActiveRecord::Migration
  def change
    create_table :things do |t|
      t.string    :title
      t.text      :description
      t.float     :latitude
      t.float     :longitude
      t.timestamp :expires_at

      t.timestamps
    end
  end
end
