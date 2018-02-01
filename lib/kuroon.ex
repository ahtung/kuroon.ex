defmodule Kuroon do
  alias Porcelain.Result
  @moduledoc """
  Documentation for Kuroon.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Kuroon.hello
      :world

  """
  def hello do
    :world
  end

  def clone(repo_from, repo_to, remote_name) do
    folder = SecureRandom.base64(8)
    cmd = "git clone git@github.com:#{repo_from}.git /tmp/#{folder}"
    result = Porcelain.shell(cmd)
    rm_remote = Porcelain.shell("cd /tmp/#{folder} && git remote rm #{remote_name}")
    add_remote = Porcelain.shell("cd /tmp/#{folder} && git remote add #{remote_name} git@github.com:#{repo_to}.git")
    push = Porcelain.shell("cd /tmp/#{folder} && git push #{remote_name} master")
    if push.err == nil do
      IO.puts "success" 
    end
  end
end
