class AppointmentsController < ApplicationController
    def new
        #@appointment = @doctor.appointments.new
    end
  
    private
    def set_doctor
      @doctor = Doctor.find(params[:doctor_id])
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def set_users
      @users = (User.all.order("name") - @doctor.users)
    end

    def appointment_params
      params.require(:appointment).permit(:user_id, :date, :time)
    end
end