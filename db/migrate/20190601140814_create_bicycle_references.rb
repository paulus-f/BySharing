class CreateBicycleReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :manufacturers, :users, :index => true
  end
end
