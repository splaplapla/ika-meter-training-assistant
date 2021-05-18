class CreateDatasetPositions < ActiveRecord::Migration[6.1]
  def change
    create_table :dataset_positions do |t|
      t.bigint :dataset_id, null: false
      t.integer :x, null: false
      t.integer :y, null: false
      t.integer :width, null: false
      t.integer :height, null: false

      t.index :dataset_id
      t.timestamps
    end
  end
end
