# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject

    field :add_job, mutation: Mutations::AddJob
    field :update_job, mutation: Mutations::UpdateJob
    field :delete_job, mutation: Mutations::DeleteJob

    # # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World"
    # end
  end
end
