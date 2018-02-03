defmodule Kuroon do
  @moduledoc """
  Cloning will enable mankind to reach eternal life.
  """
  
  alias Porcelain.Result

  @doc """
  Clone inbetween two repos

  ## Examples

      iex> elem(Kuroon.clone("ahtung/kuroon_test_from", "ahtung/kuroon_test_to"), 0)
      :ok

  """
  @spec clone(binary, binary) :: binary
  def clone(repo_from, repo_to) when is_binary(repo_from) and is_binary(repo_to) do
    %{repo_to: repo_to, repo_from: repo_from, folder: SecureRandom.base64(8)}
    |> do_clone
    |> add_remote
    |> push
    |> clean
  end
  
  defp do_clone(params) do
    cmd = "git clone git@github.com:#{params[:repo_from]}.git /tmp/#{params[:folder]}"
    case Porcelain.shell(cmd) do
      %Result{err: nil, out: _, status: _} -> {:ok, params}
      %Result{err: error, out: _, status: _} -> {:error, error}
    end
  end

  defp add_remote({:ok, params}) do
    cmd = "cd /tmp/#{params[:folder]} && git remote add tmp git@github.com:#{params[:repo_to]}.git"
    case Porcelain.shell(cmd) do
      %Result{err: nil, out: _, status: _} -> {:ok, params}
      %Result{err: error, out: _, status: _} -> {:error, error}
    end
  end
  
  defp add_remote({:error, error}) do
    IO.puts "An error has occured: #{error}"
  end

  defp push({:ok, params}) do
    cmd = "cd /tmp/#{params[:folder]} && git push tmp master"
    case Porcelain.shell(cmd) do
      %Result{err: nil, out: _, status: _} -> {:ok, params}
      %Result{err: error, out: _, status: _} -> {:error, error}
    end
  end
  
  defp push({:error, error}) do
    IO.puts "An error has occured: #{error}"
  end
  
  defp clean({:ok, params}) do
    cmd = "rm -rf /tmp/#{params[:folder]}"
    case Porcelain.shell(cmd) do
      %Result{err: nil, out: _, status: _} -> {:ok, params}
      %Result{err: error, out: _, status: _} -> {:error, error}
    end
  end
  
  defp clean({:error, error}) do
    IO.puts "An error has occured: #{error}"
  end
end
