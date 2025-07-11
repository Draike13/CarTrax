# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# === CUSTOMERS ===
trevor = Customer.create!(
  first_name: "Trevor",
  last_name: "Biri",
  phone: "573-555-2190",
  email: "trevor.biri@example.com",
  birthday: Date.new(1991, 2, 15),
  address: "123 Oak Street, Jackson, MO"
)

jessie = Customer.create!(
  first_name: "Jessie",
  last_name: "Evans",
  phone: "573-555-8899",
  email: "jessie.evans@example.com",
  birthday: Date.new(1996, 8, 8),
  address: "456 Maple Avenue, Cape Girardeau, MO"
)


# === PARTS ===
battery = Parts::Battery.create!(data: "DieHard Gold")
brake_pad = Parts::BrakePad.create!(data: "PowerStop Z17")
brake_rotor = Parts::BrakeRotor.create!(data: "OEM Spec")
brake_fluid_type = Parts::BrakeFluidType.create!(data: "DOT 3")
engine_air_filter = Parts::EngineAirFilter.create!(data: "Fram CA9997")
cabin_air_filter = Parts::CabinAirFilter.create!(data: "Fram CF10729")
wiper_blade_size = Parts::WiperBladeSize.create!(data: "22in/20in")
headlight = Parts::Headlight.create!(data: "Halogen")
taillight = Parts::Taillight.create!(data: "LED")
turn_signal_light = Parts::TurnSignalLight.create!(data: "Amber")
license_plate_light = Parts::LicensePlateLight.create!(data: "Standard")
serpentine_belt = Parts::SerpentineBelt.create!(data: "Gates Micro-V")
thermostat = Parts::Thermostat.create!(data: "Stant SuperStat")
oil_viscosity = Parts::EngineOilViscosity.create!(data: "5W-30")
oil_quantity = Parts::EngineOilQuantity.create!(data: "5.2 qt")
oil_filter = Parts::EngineOilFilter.create!(data: "Mobil 1 M1-110A")
trans_fluid_type = Parts::TransmissionFluidType.create!(data: "Nissan Matic S")
trans_fluid_qty = Parts::TransmissionFluidQuantity.create!(data: "9.0 qt")
coolant = Parts::CoolantType.create!(data: "Peak 50/50")
tire_size = Parts::TireSize.create!(data: "225/45R18")
tire_brand = Parts::TireBrand.create!(data: "Michelin Pilot Sport")
timing_chain = Parts::TimingChain.create!(data: "Cloyes 9-0393SB")
timing_sprocket = Parts::TimingSprocket.create!(data: "OEM Dual VVT-i")
timing_tensioner = Parts::TimingTensioner.create!(data: "Cloyes 9-0753")
crankshaft_sprocket = Parts::CrankshaftSprocket.create!(data: "OEM Sprocket")
vvt_solenoid = Parts::VvtSolenoid.create!(data: "Dorman 917-215")
camshaft_sensor = Parts::CamshaftPositionSensor.create!(data: "Hitachi CPS0009")
crankshaft_sensor = Parts::CrankshaftPositionSensor.create!(data: "NGK EC0329")

# === CARS ===
sky = Car.create!(make: "Saturn", model: "Sky", year: 2007, trim: "Base", color: "Black", mileage: 120_000, vin: "1G8MB35B87Y000001")
g37 = Car.create!(make: "Infiniti", model: "G37x", year: 2009, trim: "Sedan", color: "Black", mileage: 210_000, vin: "JNKBV61F69M000002")

# === CUSTOMER-CAR RELATIONSHIPS ===
CarOwnership.create!(customer: trevor, car: sky)
CarOwnership.create!(customer: trevor, car: g37)
CarOwnership.create!(customer: jessie, car: g37)

# === CAR SPECS ===
CarSpec.create!(car: sky,
  engine_oil_viscosity: oil_viscosity,
  engine_oil_quantity: oil_quantity,
  engine_oil_filter: oil_filter,
  brake_fluid_type: brake_fluid_type,
  brake_pad: brake_pad,
  brake_rotor: brake_rotor,
  tire_size: tire_size,
  tire_brand: tire_brand,
  transmission_fluid_type: trans_fluid_type,
  transmission_fluid_quantity: trans_fluid_qty,
  coolant_type: coolant,
  engine_air_filter: engine_air_filter,
  cabin_air_filter: cabin_air_filter,
  wiper_blade_size: wiper_blade_size,
  headlight: headlight,
  taillight: taillight,
  turn_signal_light: turn_signal_light,
  license_plate_light: license_plate_light,
  battery: battery,
  serpentine_belt: serpentine_belt,
  thermostat: thermostat)

CarSpec.create!(car: g37,
  engine_oil_viscosity: oil_viscosity,
  engine_oil_quantity: oil_quantity,
  engine_oil_filter: oil_filter,
  brake_fluid_type: brake_fluid_type,
  brake_pad: brake_pad,
  brake_rotor: brake_rotor,
  tire_size: tire_size,
  tire_brand: tire_brand,
  transmission_fluid_type: trans_fluid_type,
  transmission_fluid_quantity: trans_fluid_qty,
  coolant_type: coolant,
  engine_air_filter: engine_air_filter,
  cabin_air_filter: cabin_air_filter,
  wiper_blade_size: wiper_blade_size,
  headlight: headlight,
  taillight: taillight,
  turn_signal_light: turn_signal_light,
  license_plate_light: license_plate_light,
  battery: battery,
  serpentine_belt: serpentine_belt,
  thermostat: thermostat)

# === SERVICE RECORDS ===
sky_service = ServiceRecord.create!(car: sky, service_date: Date.today - 30, mileage: 119_500, notes: "Pre-sale prep work")
g37_service = ServiceRecord.create!(car: g37, service_date: Date.today - 10, mileage: 209_000, notes: "Engine diagnostics")

# === JOBS ===
tire_service = Jobs::TireService.create!(
  service_record: sky_service,
  tire_size: tire_size,
  tire_brand: tire_brand,
  tires_rotated: true,
  front_tires_replaced: false,
  rear_tires_replaced: true,
  tire_pressure_sensors_replaced: false
)

thermostat_service = Jobs::ThermostatService.create!(
  service_record: sky_service,
  thermostat: thermostat
)

timing_service = Jobs::TimingService.create!(
  service_record: g37_service,
  timing_chain: timing_chain,
  timing_chain_replaced: true,
  timing_chain_replaced_all: true,
  timing_chain_notes: "Complete kit",
  timing_sprocket: timing_sprocket,
  intake_sprocket_replaced: true,
  intake_sprocket_notes: "Worn teeth",
  exhaust_sprocket_replaced: false,
  exhaust_sprocket_notes: "Still OK",
  timing_tensioner: timing_tensioner,
  tensioners_replaced: true,
  tensioners_replaced_all: true,
  tensioner_notes: "All new",
  crankshaft_sprocket: crankshaft_sprocket,
  crankshaft_sprocket_replaced: true
)

electrical_timing_service = Jobs::ElectricalTimingService.create!(
  service_record: g37_service,
  vvt_solenoid: vvt_solenoid,
  vvt_solenoids_replaced: true,
  camshaft_position_sensor: camshaft_sensor,
  camshaft_sensors_replaced: true,
  crankshaft_position_sensor: crankshaft_sensor,
  crankshaft_sensor_replaced: false
)
