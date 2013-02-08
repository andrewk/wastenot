class AddReportedGoneAtToThings < ActiveRecord::Migration
  def change
    add_column :things, :reported_gone_at, :timestamp
  end
end
