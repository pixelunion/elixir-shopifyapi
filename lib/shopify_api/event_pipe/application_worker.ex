defmodule ShopifyAPI.EventPipe.ApplicationWorker do
  @moduledoc """
  Worker for processing application destined jobs
  """
  import ShopifyAPI.EventPipe.Worker
  alias ShopifyAPI.Shop
  alias ShopifyAPI.EventPipe.Event

  def perform(%Event{action: "post_install", token: _} = event) do
    execute_action(event, fn token, _ ->
      Shop.post_install(token)
    end)
  end
end
