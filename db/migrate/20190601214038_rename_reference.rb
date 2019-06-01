class RenameReference < ActiveRecord::Migration[5.2]
  def change
    remove_reference :rent, :bike
    add_reference :rent, :bicycle
  end
end
