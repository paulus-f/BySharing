class RemoveUserManufactures < ActiveRecord::Migration[5.2]
  def change
    remove_reference :manufacturers, :users
  end
end
