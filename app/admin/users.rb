# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :name, :phone, :email
end
