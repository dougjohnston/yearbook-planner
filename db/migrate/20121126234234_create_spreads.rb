class CreateSpreads < ActiveRecord::Migration
  def change
    create_table :spreads do |t|
      t.references :section
      t.references :deadline
      t.string :title
      t.text :description
      t.integer :position
      t.boolean :split

      t.timestamps
    end

    add_index :spreads, :section_id
  end
end
