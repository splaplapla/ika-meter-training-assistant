class AddDigestToDatasets < ActiveRecord::Migration[6.1]
  def change
    add_column :datasets, :digest, :string
    add_index :datasets, :digest, unique: true
  end
end
