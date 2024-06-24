defmodule AshUnionIssue.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AshUnionIssueWeb.Telemetry,
      AshUnionIssue.Repo,
      {DNSCluster, query: Application.get_env(:ash_union_issue, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: AshUnionIssue.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: AshUnionIssue.Finch},
      # Start a worker by calling: AshUnionIssue.Worker.start_link(arg)
      # {AshUnionIssue.Worker, arg},
      # Start to serve requests, typically the last entry
      AshUnionIssueWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: AshUnionIssue.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AshUnionIssueWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
