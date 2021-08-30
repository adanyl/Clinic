# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @doctors = Doctor.all
  end
end
