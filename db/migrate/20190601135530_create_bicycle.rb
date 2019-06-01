class CreateBicycle < ActiveRecord::Migration[5.2]
  def change
    create_table :bicycles do |t|
      t.string :name
      t.integer :price
      t.string :type
      t.decimal :longitude
      t.decimal :latitude
    end
  end
end
