class CreateDatasetQualities < ActiveRecord::Migration[6.1]
  def change
    create_table :dataset_qualities do |t|
      t.bigint :dataset_id, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end
