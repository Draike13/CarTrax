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

  def search_by_vin
    vin = params[:vin].strip.upcase
    car = Car.find_by("UPPER(vin) = ?", vin)

    if car
      render json: car, status: :ok
    else
      render json: {}, status: :ok
    end
  end

  def filter
    year = params[:year].presence
    make = params[:make].presence
    model = params[:model].presence

    cars = Car.all
    cars = cars.where(year: year) if year
    cars = cars.where("LOWER(make) = ?", make.downcase) if make
    cars = cars.where("LOWER(model) = ?", model.downcase) if model

    render json: cars, status: :ok
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
