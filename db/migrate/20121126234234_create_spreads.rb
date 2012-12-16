class CreateSpreads < ActiveRecord::Migration
  def change
    create_table :spreads do |t|
      t.references :section
      t.integer :position

      t.timestamps
    end

    #create_table :spreads_users do |t|
      #t.references :spread
      #t.references :user
    #end

    add_index :spreads, :section_id
  end
end
