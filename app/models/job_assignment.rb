class JobAssignment < ApplicationRecord
  belongs_to :service_record
  belongs_to :job, polymorphic: true
end
