defmodule Mix.Tasks.Kuroon.Clone do
	use Mix.Task
  alias Porcelain.Result
  alias Porcelain.Process, as: Proc
	@doc "start task"
	def run([repo_from, repo_to, remote_name]) do
    folder = SecureRandom.base64(8)
		clone(repo_from, folder) 
      |> remove_remote(remote_name) 
      |> add_remote(repo_to, remote_name) 
      |> push(remote_name)
	end

	defp clone(repo_from, folder) do
    IO.puts "Cloning repository"
    cmd = "git clone git@github.com:#{repo_from}.git /tmp/#{folder}"
    result = Porcelain.shell(cmd)
    folder
  end

  defp remove_remote(folder, remote_name) do
    IO.puts "Removing old remote"
    rm_remote = Porcelain.shell("cd /tmp/#{folder} && git remote rm #{remote_name}")
    folder
  end

  defp add_remote(folder, repo_to, remote_name) do
    IO.puts "Adding new remote"
    add_remote = Porcelain.shell("cd /tmp/#{folder} && git remote add #{remote_name} git@github.com:#{repo_to}.git")
    folder
  end

  defp push(folder, remote_name) do
    IO.puts "Pushing repository to new remote"
    push = Porcelain.shell("cd /tmp/#{folder} && git push #{remote_name} master")
    if push.err == nil do
      IO.puts "success" 
    end
  end
end