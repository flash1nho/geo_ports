class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.string :title, null: false
      t.float :lat, null: false
      t.float :lng, null: false

      t.timestamps
    end

    add_index :ports, [:lat, :lng]
  end
end
