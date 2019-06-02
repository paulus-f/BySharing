ActiveAdmin.register Rent do
  permit_params :current_price, :start_date, :end_date, :finished_tenant,
                :finished_owner, :user_id, :bike_id

  index do
    selectable_column
    id_column
    column :current_price
    column :start_date
    column :end_date
    column :finished_tenant
    column :finished_owner
    column :user_id
    column :bike_id
    actions
  end

  filter :current_price
  filter :start_date
  filter :user_id
  filter :bike_id

  form do |f|
    f.inputs do
      f.input :current_price
    end
    f.actions
  end

end
