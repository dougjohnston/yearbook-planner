class CreateDeadlines < ActiveRecord::Migration
  def change
    create_table :deadlines do |t|
      t.references :yearbook
      t.string :title
      t.text :description
      t.datetime :due_date

      t.timestamps
    end
    add_index :deadlines, :yearbook_id
  end
end
