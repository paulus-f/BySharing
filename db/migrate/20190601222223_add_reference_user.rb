class AddReferenceUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :bicycles, :user
  end
end
