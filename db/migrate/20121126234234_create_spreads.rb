class CreateSpreads < ActiveRecord::Migration
  def change
    create_table :spreads do |t|
      t.references :section
      t.references :deadline
      t.references :left_page
      t.references :right_page
      t.string :title
      t.text :description
      t.integer :spread_order
      t.integer :left_page
      t.integer :right_page

      t.timestamps
    end

    add_index :spreads, :section_id
  end
end
