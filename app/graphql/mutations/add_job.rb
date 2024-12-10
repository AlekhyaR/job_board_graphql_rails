module Mutations
  class AddJob < BaseMutation
    argument :title, String, required: true
    argument :job_type, String, required: true
    argument :location, String, required: true
    argument :description, String, required: false
    argument :salary, String, required: false

    field :job, Types::JobType, null: true
    field :errors, [String], null: false

    def resolve(title:, job_type:, location:, description: nil, salary: nil)
      job = Job.new(title: title, job_type: job_type, location: location, description: description, salary: salary)
      if job.save
        { job: job, errors: [] }
      else
        { job: nil, errors: job.errors.full_messages }
      end
    end
  end
end