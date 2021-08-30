# frozen_string_literal: true

class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @appointments = Appointment.where(doctor_id: current_doctor.id)
  end

  def create
    @comment = Comment.new(com_params)
    redirect_to root_path if @comment.save
  end

  def com_params
    params.require(:comment).permit(:appointment_id, :text)
  end

  def show
    @appointment = Appointment.where(user_id: current_user.id)
    @comments = Comment.where(appointment: @appointment)
  end

  def index
    @comments = Comment.where(:appointment.user_id => current_user.id)
  end
end
