ActiveAdmin.register Appointment do
    permit_params :user_id, :doctor_id, :date, :time
end