# frozen_string_literal: true

class PagesController < ApplicationController
  def home; end

  def sign_up; end

  def sign_in; end

  def about; end

  def contact; end

  def our_doctors
    @categories = Category.joins(:doctors).distinct
    @selected_category_id = params[:doctor][:category_id] if params[:doctor] && params[:doctor][:category_id]

    @doctors = if params[:doctor] && params[:doctor][:category_id]
                 Doctor.search(params[:doctor][:category_id])
               else
                 Doctor.all
               end
  end
end
