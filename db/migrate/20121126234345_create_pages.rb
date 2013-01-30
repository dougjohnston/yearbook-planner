class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :spread
      t.references :deadline
      t.string :title
      t.text :description
      t.boolean :left, :default => false

      t.timestamps
    end
  end
end
