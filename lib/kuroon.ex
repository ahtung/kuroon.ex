defmodule Kuroon do
  @moduledoc """
  Cloning will enable mankind to reach eternal life.
  """

  @doc """
  Clone inbetween two repos

  ## Examples

      iex> Kuroon.clone("ahtung/kuroon_test_from", "ahtung/kuroon_test_to")
      :ok

  """
  @spec clone(binary, binary) :: binary
  def clone(repo_from, repo_to) when is_binary(repo_from) and is_binary(repo_to) do
    folder = SecureRandom.base64(8)
    Porcelain.shell("git clone git@github.com:#{repo_from}.git /tmp/#{folder}")
    Porcelain.shell("cd /tmp/#{folder} && git remote add tmp git@github.com:#{repo_to}.git")
    Porcelain.shell("cd /tmp/#{folder} && git push tmp master --force")
    Porcelain.shell("rm -rf /tmp/#{folder}")
  
    :ok
  end
end
