defmodule AshUnionIssue.Repo do
  use Ecto.Repo,
    otp_app: :ash_union_issue,
    adapter: Ecto.Adapters.Postgres
end
