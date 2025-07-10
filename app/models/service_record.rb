class ServiceRecord < ApplicationRecord
  belongs_to :car

  has_many :job_assignments
  has_many :jobs, through: :job_assignments, source: :job, source_type: "YourJobClass"
end
