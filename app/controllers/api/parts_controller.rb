class Api::PartsController < ApplicationController
  before_action :set_part_model

  def index
    render json: @model.all
  end

  def create
    parts = @model.new(part_params)
    if part.save
      render json: parts, status: :created
    else
      render json: { errors: part.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    part = @model.find(params[:id])
    if part.update(part_params)
      render json: part
    else
      render json: { errors: part.errors.full_messages }, status: :unprocessable_entity
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
      "brake fluid_type" => Parts::Brake_fluid_type,
      "brake pad" => Parts::Brake_pad,
      "brake rotor" => Parts::Brake_rotor,
      "cabin air filter" => Parts::Cabin_air_filter,
      "camshaft position sensor" => Parts::Camshaft_position_sensor,
      "coil pack" => Parts::Coil_pack,
      "coolant type" => Parts::Coolant_type,
      "crankshaft position sensor" => Parts::Crankshaft_position_sensor,
      "crankshaft sprocket" => Parts::Crankshaft_sprocket,
      "engine air filter" => Parts::Engine_air_filter,
      "engine oil filter" => Parts::Engine_oil_filter,
      "engine oil quantity" => Parts::Engine_oil_quanitity,
      "engine oil viscosity" => Parts::Engine_oil_viscosity,
      "head gasket" => Parts::Head_gasket,
      "headlight" => Parts::Headlight,
      "license plate light" => Parts::License_plate_light,
      "maf map sensor" => Parts::Maf_map_sensor,
      "serpentine belt" => Parts::Serpentine_belt,
      "shocks strut" => Parts::Shocks_strut,
      "spark plug" => Parts::Spark_plug,
      "taillight" => Parts::Taillight,
      "thermostat" => Parts::Thermostat,
      "throttle position sensor" => Parts::Throttle_position_sensor,
      "timing chain" => Parts::Timing_chain,
      "timing sprocket" => Parts::Timing_sprocket,
      "timing tensioner" => Parts::Timing_tensioner,
      "tire brand" => Parts::Tire_brand,
      "tire size" => Parts::Tire_size,
      "transmission fluid quantity" => Parts::Transmission_fluid_quantity,
      "transmission fluid type" => Parts::Transmission_fluid_type,
      "turn signal light" => Parts::Turn_signal_light,
      "valve cover gasket" => Parts::Valve_cover_gasket,
      "vvt solenoid" => Parts::Vvt_solenoid,
      "wiper blade size" => Parts::Wiper_blade_size
  }
    @model = allowed_models[params[:type].to_s.downcase]
    render json: { error: "Invalid part type" }, status: :bad_request unless @model
  end

  def part_params
    params.require(:part).permit(:data)
  end
end
