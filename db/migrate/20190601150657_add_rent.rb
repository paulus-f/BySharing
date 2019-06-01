class AddRent < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.integer :current_price
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :finished_tenant
      t.boolean :finished_owner
      t.references :user
      t.references :bicycle
      t.timestamps
    end
  end
end
