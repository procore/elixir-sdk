defmodule HttpClient.Application do
  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Cachex.start_link(arg)
      {Cachex, :a}
    ]

    opts = [strategy: :one_for_one, name: HttpClient.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
