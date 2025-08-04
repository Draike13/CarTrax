class Api::PartsController < ApplicationController
  before_action :set_part_model

  def index
    render json: @model.all
  end

  def create
    parts = @model.new(part_params)
    if part.save
      render json: part, status: :created
    else
      render json: {errors: part.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    part = @model.find(params[:id])
    if part.update(part_params)
      render json: part
    else 
      render json: { errors: part.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @model.find(params[:id]).destroy
    head :no_content
  end


  private

  def set_part_model
    allowed_models = {
      "battery" => Parts::Battery,
      "brake_fluid_type" => Parts::Brake_fluid_type,
      "brake_pad" => Parts::Brake_pad,
      "brake_rotor" => Parts::Brake_rotor,
      "cabin_air_filter" => Parts::Cabin_air_filter,
      "camshaft_position_sensor" => Parts::Camshaft_position_sensor,
      "coil_pack" => Parts::Coil_pack,
      "coolant_type" => Parts::Coolant_type,
      "crankshaft_position_sensor" => Parts::Crankshaft_position_sensor,
      "crankshaft_sprocket" => Parts::Crankshaft_sprocket,
      "engine_air_filter" => Parts::Engine_air_filter,
      "engine_oil_filter" => Parts::Engine_oil_filter,
      "engine_oil_quantity" => Parts::Engine_oil_quanitity,
      "engine_oil_viscosity" => Parts::Engine_oil_viscosity,
      "head_gasket" => Parts::Head_gasket,
      "headlight" => Parts::Headlight,
      "license_plate_light" => Parts::License_plate_light,
      "maf_map_sensor" => Parts::Maf_map_sensor,
      "serpentine_belt" => Parts::Serpentine_belt,
      "shocks_strut" => Parts::Shocks_strut,
      "spark_plug" => Parts::Spark_plug,
      "taillight" => Parts::Taillight,
      "thermostat" => Parts::Thermostat,
      "throttle_position_sensor" => Parts::Throttle_position_sensor,
      "timing_chain" => Parts::Timing_chain,
      "timing_sprocket" => Parts::Timing_sprocket,
      "timing_tensioner" => Parts::Timing_tensioner,
      "tire_brand" => Parts::Tire_brand,
      "tire_size" => Parts::Tire_size,
      "transmission_fluid_quantity" => Parts::Transmission_fluid_quantity,
      "transmission_fluid_type" => Parts::Transmission_fluid_type,
      "turn_signal_light" => Parts::Turn_signal_light,
      "valve_cover_gasket" => Parts::Valve_cover_gasket,
      "vvt_solenoid" => Parts::Vvt_solenoid,
      "wiper_blade_size" => Parts::Wiper_blade_size
  }
    @model = allowed_models[params[:type].to_s.downcase]
    render json: {error: "Invalid part type"}, status: :bad_request unless @model
  end

  def part_params
    params.require(:part).permit(:data)
  end
end
