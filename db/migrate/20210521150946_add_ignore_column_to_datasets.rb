class AddIgnoreColumnToDatasets < ActiveRecord::Migration[6.1]
  def change
    add_column :datasets, :ignore, :boolean, default: false
  end
end
