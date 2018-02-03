defmodule Kuroon do
  @moduledoc """
  Cloning will enable mankind to reach eternal life.
  """
  
  alias Porcelain.Result
  alias Kuroon.Repo

  @doc """
  Clone inbetween two repos

  ## Examples

      iex> elem(Kuroon.clone("ahtung/kuroon_test_from", "ahtung/kuroon_test_to"), 0)
      :ok

  """
  @spec clone(binary, binary) :: binary
  def clone(repo_from, repo_to) when is_binary(repo_from) and is_binary(repo_to) do
    %Repo{to: repo_to, from: repo_from, pwd: SecureRandom.base64(8)}
    |> do_clone
    |> add_remote
    |> push
    |> clean
  end
  
  defp do_clone(repo) do
    cmd = "git clone git@github.com:#{repo.from}.git /tmp/#{repo.pwd}"
    case Porcelain.shell(cmd) do
      %Result{err: _, out: _, status: 0} -> {:ok, repo}
      %Result{err: error, out: _, status: _} -> {:error, error}
    end
  end

  defp add_remote({:ok, repo}) do
    cmd = "cd /tmp/#{repo.pwd} && git remote add tmp git@github.com:#{repo.to}.git"
    case Porcelain.shell(cmd) do
      %Result{err: _, out: _, status: 0} -> {:ok, repo}
      %Result{err: error, out: _, status: _} -> {:error, error}
    end
  end
  
  defp add_remote({:error, error}), do: {:error, error}

  defp push({:ok, repo}) do
    cmd = "cd /tmp/#{repo.pwd} && git push tmp master"
    case Porcelain.shell(cmd) do
      %Result{err: _, out: _, status: 0} -> {:ok, repo}
      %Result{err: error, out: _, status: _} -> {:error, error}
    end
  end
  
  defp push({:error, error}), do: {:error, error}
  
  defp clean({:ok, repo}) do
    cmd = "rm -rf /tmp/#{repo.pwd}"
    case Porcelain.shell(cmd) do
      %Result{err: _, out: _, status: 0} -> {:ok, repo}
      %Result{err: error, out: _, status: _} -> {:error, error}
    end
  end
  
  defp clean({:error, error}), do: {:error, error}
end
