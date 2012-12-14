class CreateYearbooks < ActiveRecord::Migration
  def change
    create_table :yearbooks do |t|
      t.references :school
      t.string :starting_year
      t.string :ending_year
      t.string :title
      t.string :theme

      t.timestamps
    end

    create_table :users_yearbooks do |t|
      t.references :user
      t.references :yearbook
    end
  end
end
