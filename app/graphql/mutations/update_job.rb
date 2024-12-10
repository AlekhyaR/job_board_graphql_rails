module Mutations
  class UpdateJob < Mutations::BaseMutation
    argument :id, ID, required: true      
    argument :title, String, required: false
    argument :job_type, String, required: false
    argument :location, String, required: false
    argument :description, String, required: false
    argument :salary, String, required: false

    field :job, Types::JobType, null: true
    field :errors, [String], null: false

    def resolve(id:, title: nil, job_type: nil, location: nil, description: nil, salary: nil)
      job = Job.find(id)
      if job.update(title: title, job_type: job_type, location: location, description: description, salary: salary)
        { job: job, errors: [] }
      else
        { job: nil, errors: job.errors.full_messages }
      end
    end
  end 
end