class RenameBikeInRents < ActiveRecord::Migration[5.2]
  def change
    remove_reference :bike, :rents
    add_reference :bicycles, :manufacturer
  end
end
