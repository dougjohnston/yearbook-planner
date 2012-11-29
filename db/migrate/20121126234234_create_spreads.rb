class CreateSpreads < ActiveRecord::Migration
  def change
    create_table :spreads do |t|
      t.references :section
      t.integer :position

      t.timestamps
    end
    add_index :spreads, :section_id
  end
end
