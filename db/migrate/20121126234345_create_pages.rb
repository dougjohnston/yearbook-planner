class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :spread
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
