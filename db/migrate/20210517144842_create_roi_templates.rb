class CreateRoiTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :roi_templates do |t|
      t.integer :x
      t.integer :y
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end
end
