defmodule AshUnionIssueWeb.Resources.OneOfTheChildren do
  use Ash.Resource, data_layer: :embedded

  attributes do
    attribute :prompt, :string, allow_nil?: false, public?: true
    attribute :response, :string, public?: true
  end

  actions do
    default_accept [:prompt, :response]
    defaults [:create, :read, :update, :destroy]
  end

end
