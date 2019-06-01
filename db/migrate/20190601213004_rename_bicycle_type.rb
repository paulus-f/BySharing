class RenameBicycleType < ActiveRecord::Migration[5.2]
  def change
    rename_column :bicycles, :type, :bike_type
  end
end
