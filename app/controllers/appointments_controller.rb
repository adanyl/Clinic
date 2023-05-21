# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :check_if_logged_in
  before_action :authenticate_user!, only: :create
  before_action :check_if_doctor, only: :edit

  def create
    appointment = current_user.appointments.new(appointment_params)
    if appointment.save
      redirect_to appointments_path, method: :get, notice: 'Запис створено'
      TimeSlot.find(params[:appointment][:time_slot_id]).unavailable!
    end
  end

  def show
    @appointment = if current_user
                     current_user.appointments.find_by(id: params[:id])
                   else
                     current_doctor.appointments.find_by(id: params[:id])
                   end

    redirect_to appointments_path, alert: 'Ви можете дивитись тільки ваші прийоми' if @appointment.blank?
  end

  def index
    @appointments = if current_doctor
                      current_doctor.appointments.order(id: :desc)
                    else
                      current_user.appointments.order(id: :desc)
                    end

    if params[:date].present? || params[:time].present? || params[:status].present?
      filter_appointments(params[:date], params[:time],
                          params[:status])
    end
  end

  def edit
    @appointment = current_doctor.appointments.find_by(id: params[:id])

    redirect_to appointments_path, alert: 'Ви можете редагувати тільки свої записи' if @appointment.blank?
  end

  def update
    @appointment = Appointment.find(params[:id])

    @appointment.assign_attributes(appointment_params)

    if @appointment.save
      redirect_to @appointment, notice: 'Прийом успішно завершений' if @appointment.completed?
      if @appointment.canceled?
        @appointment.time_slot.available!
        redirect_to @appointment, notice: 'Прийом успішно скасований' if @appointment.canceled?
      end
    else
      flash[:alert] = 'Ви не можете завершити цей прийом'
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:time_slot_id, :comment, :status)
  end

  def filter_appointments(date, _time, status)
    @appointments = @appointments.includes(:time_slot).where(time_slot: { date: date }) if date.present?
    @appointments = @appointments.where(status: appointment_status(status)) if status.present?
  end

  def appointment_status(status)
    case status
    when 'Заплановані'
      :scheduled
    when 'Завершені'
      :completed
    when 'Скасовані'
      :canceled
    end
  end
end
