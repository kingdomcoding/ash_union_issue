defmodule AshUnionIssueWeb.Resources.Parent do
  use Ash.Resource, domain: AshUnionIssueWeb.Domain

  alias AshUnionIssueWeb.Resources.Children

  attributes do
    uuid_primary_key :id
    attribute :children, {:array, Children}, public?: true
  end

  actions do
    default_accept [:children]
    defaults [:create, :read, :update]
  end

end
