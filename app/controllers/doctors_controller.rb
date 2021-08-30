# frozen_string_literal: true

class DoctorsController < ApplicationController
  def index
    @doctors = if params[:doctor] && params[:doctor][:category_id]
                 Doctor.search(params[:doctor][:category_id])
               else
                 Doctor.all
               end
    @categories = Category.all
  end

  def doctor_params
    params.require(:doctor).permit(:name, :category_id)
  end

  def show; end

  def new; end
end
