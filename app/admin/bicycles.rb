ActiveAdmin.register Bicycle do
  permit_params :name, :price, :bike_type, :manufacturer_id

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :bike_type
    column :manufacturer_id
    actions
  end

  filter :name
  filter :price
  filter :bike_type
  filter :manufacturer_id

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :bike_type
    end
    f.actions
  end

end
