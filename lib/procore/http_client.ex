defmodule Procore.HttpClient do
  use Tesla
  plug(Tesla.Middleware.EncodeJson)
  plug(Tesla.Middleware.RetryBackoff)
  plug(Tesla.Middleware.HandleResponse)
  plug(Tesla.Middleware.Logger)

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    {:ok, {%{}, opts}}
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end
end
