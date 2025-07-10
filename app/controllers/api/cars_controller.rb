class Api::CarsController < ApplicationController
  def index
    cars = Car.all
    render json: cars
  end

  def show
    car = Car.find(params[:id])
    if params[:with] == "specs"
    render json: car.as_json(include: :car_spec)
    else
      render json: car
    end
  end

  def service_records
    car = Car.find(params[:car_id])
    records = car.service_records.includes(:job_assignments)
    render json: {
      car: car,
      service_records: records.as_json(include: :job_assignments)
    }
  end
end
