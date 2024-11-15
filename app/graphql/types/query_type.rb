# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    field :jobs, [Types::JobType], null: false do
      argument :id, Integer, required: false
      argument :title, String, required: false
      argument :description, String, required: true
      argument :job_type, String, required: true
      argument :location, String, required: true
      argument :salary, String, required: true
      argument :active, Boolean, required: true
    end

    field :all_jobs, [Types::JobType], null: false

    def all_jobs
      Job.all
    end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
