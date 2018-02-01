defmodule Kuroon do
  alias Porcelain.Result
  @moduledoc """
  Documentation for Kuroon.
  """

  @doc """
  Clone in between two repos

  ## Examples

      iex> Kuroon.clone("ahtung/kuroon_test_from", "ahtung/kuroon_test_to", "origin")
      :ok

  """
  def clone(repo_from, repo_to, remote_name) do
    folder = SecureRandom.base64(8)
    Porcelain.shell("git clone git@github.com:#{repo_from}.git /tmp/#{folder}")
    Porcelain.shell("cd /tmp/#{folder} && git remote rm #{remote_name}")
    Porcelain.shell("cd /tmp/#{folder} && git remote add #{remote_name} git@github.com:#{repo_to}.git")
    Porcelain.shell("cd /tmp/#{folder} && git push #{remote_name} master --force")
    Porcelain.shell("rm -rf /tmp/#{folder}")
  
    :ok
  end
end
