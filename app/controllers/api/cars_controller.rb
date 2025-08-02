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
    if params[:with] == "details"
      render json: {
        car: car,
      service_records: records.as_json(
        include: {
          job_assignments: {
            include: :job,
            methods: :job_type
          }
        }
      )
      }
    else
    render json: {
      car: car,
      service_records: records.as_json(include: :job_assignments)
    }
    end
  end

  def create
    car = Car.new(car_params)
    if car.save
      render json: car, status: :created
    else
      render json: { errors: car.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    car = Car.find(params[:id])
    if car.update(car_params)
      render json: car, status: :ok
    else
      render json: { errors: car.errors.full_meddages }, status: :unprocessable_entity
    end
  end

 def destroy
    car = Car.find(params[:id])
    if car.destroy
      render json: { message: "Car deleted successfully" }, status: :ok
    else
      render json: { errors: car.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def car_params
    params.require(:car).permit(
      :vin, :make, :model, :year, :trim, :color, :mileage, :notes
      )
  end
end
