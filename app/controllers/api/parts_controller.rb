class Api::PartsController < ApplicationController
  before_action :set_part_model

  def index
    render json: @model.all.map { |p| p.as_json.merge(type: params[:type]) }
  end

  def create
    part = @model.new(part_params)
    if part.save
      render json: part, status: :created
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
      "brake fluid type" => Parts::BrakeFluidType,
      "brake pad" => Parts::BrakePad,
      "brake rotor" => Parts::BrakeRotor,
      "cabin air filter" => Parts::CabinAirFilter,
      "camshaft position sensor" => Parts::CamshaftPositionSensor,
      "coil pack" => Parts::CoilPack,
      "coolant type" => Parts::CoolantType,
      "crankshaft position sensor" => Parts::CrankshaftPositionSensor,
      "crankshaft sprocket" => Parts::CrankshaftSprocket,
      "engine air filter" => Parts::EngineAirFilter,
      "engine oil filter" => Parts::EngineOilFilter,
      "engine oil quantity" => Parts::EngineOilQuantity,
      "engine oil viscosity" => Parts::EngineOilViscosity,
      "head gasket" => Parts::HeadGasket,
      "headlight" => Parts::Headlight,
      "license plate light" => Parts::LicensePlateLight,
      "maf map sensor" => Parts::MafMapSensor,
      "serpentine belt" => Parts::SerpentineBelt,
      "shocks strut" => Parts::ShocksStrut,
      "spark plug" => Parts::SparkPlug,
      "taillight" => Parts::Taillight,
      "thermostat" => Parts::Thermostat,
      "throttle position sensor" => Parts::ThrottlePositionSensor,
      "timing chain" => Parts::TimingChain,
      "timing sprocket" => Parts::TimingSprocket,
      "timing tensioner" => Parts::TimingTensioner,
      "tire brand" => Parts::TireBrand,
      "tire size" => Parts::TireSize,
      "transmission fluid quantity" => Parts::TransmissionFluidQuantity,
      "transmission fluid type" => Parts::TransmissionFluidType,
      "turn signal light" => Parts::TurnSignalLight,
      "valve cover gasket" => Parts::ValveCoverGasket,
      "vvt solenoid" => Parts::VvtSolenoid,
      "wiper blade size" => Parts::WiperBladeSize
  }
    @model = allowed_models[params[:type].to_s.downcase]
    render json: { error: "Invalid part type" }, status: :bad_request unless @model
  end

  def part_params
    params.require(:part).permit(:data)
  end
end
