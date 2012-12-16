class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :yearbook
      t.string :title
      t.text :details
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end

    #create_table :events_users do |t|
      #t.references :event
      #t.references :user
    #end
  end
end
