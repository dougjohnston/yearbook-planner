class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :spread
      t.string :title
      t.boolean :left
      t.integer :page_number

      t.timestamps
    end
  end
end
