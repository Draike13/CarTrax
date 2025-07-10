class JobAssignment < ApplicationRecord
  belongs_to :service_record
  belongs_to :job, polymorphic: true

  def job_type
    job.class.name.demodulize
  end
end
