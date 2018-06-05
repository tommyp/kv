defmodule KV.Bucket do
  use Agent

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from bucket by `key`
  """
  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  @doc """
  Puts the `value` for the given `key` in the `bucket`
  """
  def put(bucket, key, value) do
    Agent.update(bucket, &Map.put(&1, key, value))
  end

  @doc """
  Delete's key from bucket

  Returns the current value of `key`, if `key` exists
  """

  def delete(bucket, key) do
    Process.sleep(1000)
    Agent.get_and_update(bucket, fn dict ->
      Process.sleep(1000)
      Map.pop(dict, key)
    end)
  end
end
