class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.references :spread
      t.references :deadline
      t.string :title
      t.boolean :left
      t.integer :page_number

      t.timestamps
    end

    #create_table :pages_users do |t|
      #t.references :page
      #t.references :user
    #end
  end
end
