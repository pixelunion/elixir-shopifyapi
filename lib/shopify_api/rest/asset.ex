defmodule ShopifyAPI.REST.Asset do
  @moduledoc """
  ShopifyAPI REST API Theme Asset resource
  """

  alias ShopifyAPI.AuthToken
  alias ShopifyAPI.REST

  @doc """
  Get a single theme asset.

  ## Example

      iex> ShopifyAPI.REST.Asset.get(auth, integer, params)
      {:ok, %{} = asset}
  """
  def get(%AuthToken{} = auth, theme_id, params \\ [], options \\ []),
    do:
      REST.get(
        auth,
        "themes/#{theme_id}/assets.json",
        params,
        Keyword.merge([pagination: :none], options)
      )

  @doc """
  Return a list of all theme assets.

  ## Example

      iex> ShopifyAPI.REST.Asset.all(auth, theme_id)
      {:ok, [%{}, ...] = assets}
  """
  def all(%AuthToken{} = auth, theme_id, params \\ [], options \\ []),
    do:
      REST.get(
        auth,
        "themes/#{theme_id}/assets.json",
        params,
        Keyword.merge([pagination: :none], options)
      )

  @doc """
  Update a theme asset.

  ## Example

    iex> ShopifyAPI.REST.Asset.update(auth, theme_id, map)
    {:ok, %{ "asset" => %{} }}
  """
  def update(%AuthToken{} = auth, theme_id, asset),
    do: REST.put(auth, "themes/#{theme_id}/assets.json", asset)

  @doc """
  Delete a theme asset.

  ## Example

      iex> ShopifyAPI.REST.Asset.delete(auth, theme_id, map)
      {:ok, 200 }
  """
  def delete(%AuthToken{} = auth, theme_id, params),
    do: REST.delete(auth, "themes/#{theme_id}/assets.json?" <> URI.encode_query(params))

  @doc """
  Create a new theme asset.

  ## Example

      iex> ShopifyAPI.REST.Theme.create(auth, theme_id, map)
      {:ok, %{ "asset" => %{} }}
  """
  def create(%AuthToken{} = auth, theme_id, asset),
    do: update(auth, theme_id, asset)
end
