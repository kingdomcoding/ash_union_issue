defmodule AshUnionIssueWeb.Resources.OneOfTheChildren do
  use Ash.Resource, data_layer: :embedded

  attributes do
    uuid_primary_key :id
    attribute :prompt, :string, allow_nil?: false, public?: true
    attribute :response, :string, public?: true
  end

  actions do
    default_accept [:prompt, :response]
    defaults [:create, :read, :update]
  end

end
