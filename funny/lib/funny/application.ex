defmodule Funny.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Funny.Worker.start_link(arg)
      # {Funny.Worker, arg}
      {Plug.Cowboy, scheme: :http, plug: Funny.Router, options: [port: 4000]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Funny.Supervisor]

    IO.inspect("Starting application...")

    Supervisor.start_link(children, opts)
  end
end
