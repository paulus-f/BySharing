class AddRent < ActiveRecord::Migration[5.2]
  def change
    create_table :rent do |t|
      t.integer :current_price
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :finished_tenant
      t.boolean :finished_owner
      t.references :user
      t.references :bike
      t.timestamps
    end
  end
end
