ActiveAdmin.register Doctor do
    permit_params :name, :phone, :category_id
end