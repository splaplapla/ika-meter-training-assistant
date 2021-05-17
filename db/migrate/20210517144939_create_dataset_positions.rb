class CreateDatasetPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :dataset_positions do |t|
      t.bigint :dataset_id, null: false
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height

      t.index :dataset_id, unique: true
      t.timestamps
    end
  end
end
