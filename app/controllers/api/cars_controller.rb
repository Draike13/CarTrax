class Api::CarsController < ApplicationController
  def index
    cars = Car.all
    render json: cars
  end

def show
  # Eager-load all associations to avoid N+1 queries
  car = Car.includes(
    car_spec: [
      :engine_oil_viscosity,
      :engine_oil_quantity,
      :engine_oil_filter,
      :brake_fluid_type,
      :brake_pad,
      :brake_rotor,
      :tire_size,
      :tire_type,
      :transmission_fluid_type,
      :transmission_fluid_quantity,
      :coolant_type,
      :engine_air_filter,
      :cabin_air_filter,
      :wiper_blade_size,
      :headlight,
      :taillight,
      :turn_signal_light,
      :license_plate_light,
      :battery,
      :serpentine_belt,
      :thermostat
    ]
  ).find(params[:id])

  if params[:with] == "specs"
    render json: car.as_json(
      include: {
        car_spec: {
          include: {
            engine_oil_viscosity: { only: [ :id, :data ] },
            engine_oil_quantity: { only: [ :id, :data ] },
            engine_oil_filter: { only: [ :id, :data ] },
            brake_fluid_type: { only: [ :id, :data ] },
            brake_pad: { only: [ :id, :data ] },
            brake_rotor: { only: [ :id, :data ] },
            tire_size: { only: [ :id, :data ] },
            tire_type: { only: [ :id, :data ] },
            transmission_fluid_type: { only: [ :id, :data ] },
            transmission_fluid_quantity: { only: [ :id, :data ] },
            coolant_type: { only: [ :id, :data ] },
            engine_air_filter: { only: [ :id, :data ] },
            cabin_air_filter: { only: [ :id, :data ] },
            wiper_blade_size: { only: [ :id, :data ] },
            headlight: { only: [ :id, :data ] },
            taillight: { only: [ :id, :data ] },
            turn_signal_light: { only: [ :id, :data ] },
            license_plate_light: { only: [ :id, :data ] },
            battery: { only: [ :id, :data ] },
            serpentine_belt: { only: [ :id, :data ] },
            thermostat: { only: [ :id, :data ] }
          }
        }
      }
    )
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

def update_specs
  car = Car.find(params[:id])

  # find existing spec sheet or build new one for this car
  spec = car.car_spec || car.build_car_spec

  if spec.update(spec_params)
    render json: { message: "Car specs updated successfully", car_spec: spec }, status: :ok
  else
     Rails.logger.error "SPEC UPDATE FAILED for Car ##{car.id}: #{spec.errors.full_messages.join(", ")}"
      render json: { errors: spec.errors.full_messages, params: spec_params }, status: :unprocessable_entity
  end
end

def clear_specs
  car = Car.find(params[:id])
  spec = car.car_spec

  unless spec
    return render json: { error: "No specs found for this car" }, status: :not_found
  end

   # Build a hash of all spec fields set to nil
   cleared_data = CarSpec.column_names.select { |col| col.end_with?("_id") || col == "thermostat_id" }.index_with { nil }

  if spec.update(cleared_data)
    render json: { message: "Spec sheet cleared successfully", car_spec: spec }, status: :ok
  else
    render json: { errors: spec.errors.full_messages }, status: :unprocessable_entity
  end
end


  private

  def car_params
    params.require(:car).permit(
      :vin, :make, :model, :year, :trim, :color, :mileage, :notes
      )
  end

  def spec_params
    params.require(:car_spec).permit(
    :engine_oil_viscosity_id,
    :engine_oil_quantity_id,
    :engine_oil_filter_id,
    :brake_fluid_type_id,
    :brake_pad_id,
    :brake_rotor_id,
    :tire_size_id,
    :tire_type_id,
    :transmission_fluid_type_id,
    :transmission_fluid_quantity_id,
    :coolant_type_id,
    :engine_air_filter_id,
    :cabin_air_filter_id,
    :wiper_blade_size_id,
    :headlight_id,
    :taillight_id,
    :turn_signal_light_id,
    :license_plate_light_id,
    :battery_id,
    :serpentine_belt_id,
    :thermostat_id
    )
  end
end
