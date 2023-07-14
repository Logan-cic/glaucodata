defmodule Glaucodata.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GlaucodataWeb.Telemetry,
      # Start the Ecto repository
      Glaucodata.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Glaucodata.PubSub},
      # Start Finch
      {Finch, name: Glaucodata.Finch},
      # Start the Endpoint (http/https)
      GlaucodataWeb.Endpoint
      # Start a worker by calling: Glaucodata.Worker.start_link(arg)
      # {Glaucodata.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Glaucodata.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    GlaucodataWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
