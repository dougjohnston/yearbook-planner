class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :yearbook
      t.references :deadline
      t.string :title
      t.string :color
      t.integer :pages
      t.integer :section_order

      t.timestamps
    end

    create_table :sections_users do |t|
      t.references :section
      t.references :user
    end

    add_index :sections, :yearbook_id
  end
end
