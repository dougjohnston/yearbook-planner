class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user
      t.references :yearbook
      t.integer :assignable_id
      t.string :assignable_type

      t.timestamps
    end
    add_index :assignments, :user_id
    add_index :assignments, :yearbook_id
  end
end
