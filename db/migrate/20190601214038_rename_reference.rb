class RenameReference < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bicycles, :manufacture
    add_reference :bicycles, :manufacturer
  end
end
