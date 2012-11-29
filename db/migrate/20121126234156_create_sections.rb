class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :yearbook
      t.string :title
      t.integer :pages
      t.integer :position

      t.timestamps
    end
    add_index :sections, :yearbook_id
  end
end
