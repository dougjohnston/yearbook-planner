class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.references :user
      t.integer :assignment_id
      t.string :assignment_type

      t.timestamps
    end
  end
end
