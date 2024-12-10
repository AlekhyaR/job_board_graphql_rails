module Mutations
  class DeleteJob < BaseMutation
    argument :id, ID, required: true

    field :job, Types::JobType, null: true
    field :errors, [String], null: false

    def resolve(id:)
      job = Job.find(id)
      if job.destroy
        { job: job, errors: [] }
      else
        { job: nil, errors: job.errors.full_messages }
      end
    end
  end
end
