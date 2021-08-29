class DoctorsController < ApplicationController
    def index
if params[:doctor] and params[:doctor][:category_id]
    @doctors = Doctor.search(params[:doctor][:category_id])
else
    @doctors = Doctor.all
end
    @categories = Category.all
    end

    def doctor_params
        params.require(:doctor).permit(:name, :category_id)
    end

    def show
    end

    def new
    end
end