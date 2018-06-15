defmodule ShopifyAPI.EventPipe.Supervisor do
  require Logger
  use Supervisor
  alias ShopifyAPI.EventPipe.WebhookEventQueue

  def start_link(opts) do
    Logger.info("Starting #{__MODULE__}...")
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(_) do
    children = [WebhookEventQueue]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
