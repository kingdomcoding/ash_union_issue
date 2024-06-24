defmodule AshUnionIssueWeb.Domain do
  use Ash.Domain

  resources do
    resource AshUnionIssueWeb.Resources.Parent do
      define :create_parent, action: :create
    end
  end
end
