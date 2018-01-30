defmodule Procore.Application do
  use Application

  @spec start(any, any) :: {:ok, pid()} | {:error, {:already_started, pid()}}
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      supervisor(Procore.HttpClient.Supervisor, []),
      {Procore, []}
    ]

    opts = [strategy: :one_for_one, name: Procore.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
