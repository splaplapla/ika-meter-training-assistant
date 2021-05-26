class CreateDbMetadata < ActiveRecord::Migration[6.1]
  def change
    create_table :db_metadata do |t|
      t.datetime :dump_completed_at, null: false

      t.timestamps
    end
  end
end
