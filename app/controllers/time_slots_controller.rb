class TimeSlotsController < ApplicationController
  before_action :check_if_logged_in
  before_action :check_if_doctor, only: %i[new create destroy]

  def new; end

  def create
    time_slot = current_doctor.time_slots.new(time_slot_params)

    if time_slot.save
      redirect_to time_slots_path, notice: 'Time Slot added'
    else
      redirect_to new_time_slot_path, alert: 'Time is taken'
    end
  end

  def index
    if current_doctor.present?
      @time_slots = current_doctor.time_slots.where(status: %i[available not_available])
    else
      @doctor = Doctor.find(params[:doctor_id])
      @time_slots = @doctor.time_slots.where(status: %i[available not_available])
    end

    if params[:filter_date].present?
      filter_date = Date.parse(params[:filter_date])
      @time_slots = @time_slots.where(date: filter_date.beginning_of_day..filter_date.end_of_day)
    end
  end

  def time_slot_params
    params.require(:time_slot).permit(:date, :time)
  end

  def destroy
    TimeSlot.find(params[:id]).destroy
    redirect_to time_slots_path, notice: 'Time Slot deleted'
  end
end
