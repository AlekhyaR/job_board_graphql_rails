module Types
  class JobType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :type, String, null: false
    field :description, String, null: false
    field :salary, String, null: false
    field :location, String, null: false
    field :active, Boolean, null: false
  end
end
