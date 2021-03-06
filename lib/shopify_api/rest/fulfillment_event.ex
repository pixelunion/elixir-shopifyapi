defmodule ShopifyAPI.REST.FulfillmentEvent do
  @moduledoc """
  ShopifyAPI REST API FulfillmentEvent resource
  """

  alias ShopifyAPI.AuthToken
  alias ShopifyAPI.REST

  @doc """
  Return a list of all fulfillment events.

  ## Example

      iex> ShopifyAPI.REST.FulfillmentEvent.all(auth, string, string)
      {:ok, [] = fulfillment_events}
  """
  def all(%AuthToken{} = auth, order_id, fulfillment_id, params \\ [], options \\ []),
    do:
      REST.get(
        auth,
        "orders/#{order_id}/fulfillments/#{fulfillment_id}/events.json",
        params,
        Keyword.merge([pagination: :none], options)
      )

  @doc """
  Get a single fulfillment event.

  ## Example

      iex> ShopifyAPI.REST.FulfillmentEvent.get(auth, string, string, string)
      {:ok, %{} = fulfillment_event}
  """
  def get(%AuthToken{} = auth, order_id, fulfillment_id, event_id, params \\ [], options \\ []),
    do:
      REST.get(
        auth,
        "orders/#{order_id}/fulfillments/#{fulfillment_id}/events/#{event_id}.json",
        params,
        Keyword.merge([pagination: :none], options)
      )

  @doc """
  Create a new fulfillment event.

  ## Example

      iex> ShopifyAPI.REST.FulfillmentEvent.post(auth, map)
      {:ok, %{} = fulfillment_event}
  """
  def post(
        %AuthToken{} = auth,
        order_id,
        %{fulfillment_event: %{id: fulfillment_id}} = fulfillment_event
      ) do
    REST.post(
      auth,
      "orders/#{order_id}/fulfillments/#{fulfillment_id}/events.json",
      fulfillment_event
    )
  end

  @doc """
  Delete a fulfillment event.

  ## Example

      iex> ShopifyAPI.REST.FulfillmentEvent.delete(auth, string, string, string)
      {:ok,  200 }
  """
  def delete(%AuthToken{} = auth, order_id, fulfillment_id, event_id) do
    REST.delete(
      auth,
      "orders/#{order_id}/fulfillments/#{fulfillment_id}/events/#{event_id}.json"
    )
  end
end
