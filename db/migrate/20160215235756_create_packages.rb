class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :package_dimentions
      t.string :package_weight
      t.string :safeguard_time
      t.string :outbound_packet_time
      t.string :entry_packet_time
      t.string :batch_number
      t.references :client, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
