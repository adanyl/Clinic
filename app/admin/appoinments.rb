# frozen_string_literal: true

ActiveAdmin.register Appointment do
  permit_params :user_id, :time_slot_id, :status, :comment
end
