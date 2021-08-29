class AppointmentsController < ApplicationController
    def new
      @appointment = Appointment.new
      @doctors = Doctor.all
    end

    def create
      @appointment = Appointment.new(user_params)
      if @appointment.save
        redirect_to root_path
      end
    end

    def destroy
      @appointment = Appointment.find(params[:id])
      @content.destroy
      redirect_to root_path
    end

    def user_params
      params.require(:appointment).permit(:user_id, :doctor_id, :date, :time)
    end

    def show
      if current_doctor.present?
        @appointments = Appointment.where(:doctor_id => current_doctor.id)
      elsif current_user.present?
        @appointments = Appointment.where(:user_id => current_user.id)
      end
    end

    def index
      if current_doctor.present?
        @appointments = Appointment.where(:doctor_id => current_doctor.id)
      elsif current_user.present?
        @appointments = Appointment.where(:user_id => current_user.id)
      end
    end
end