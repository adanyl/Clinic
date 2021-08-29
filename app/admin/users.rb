ActiveAdmin.register User do
    permit_params :name, :phone
end