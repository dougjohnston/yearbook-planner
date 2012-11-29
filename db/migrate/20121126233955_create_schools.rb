class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :city
      t.string :state_province
      t.string :country

      t.timestamps
    end
  end
end
