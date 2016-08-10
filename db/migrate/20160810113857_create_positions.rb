class CreatePositions < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE TYPE positions_enum_type AS ENUM ('Positions::Vessel', 'Positions::Cargo');
    SQL

    create_table :positions do |t|
      t.string :title, null: false
      t.integer :port_id, null: false
      t.date :date_open, null: false
      t.float :capacity, null: false

      t.timestamps
    end

    add_column :positions, :type, :positions_enum_type, null: false
    add_index :positions, [:port_id, :date_open, :type], unique: true

    add_foreign_key :positions, :ports, on_delete: :cascade
  end

  def down
    drop_table :positions

    execute <<-SQL
      DROP TYPE positions_enum_type;
    SQL
  end
end
