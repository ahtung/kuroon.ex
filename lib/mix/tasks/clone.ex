defmodule Mix.Tasks.Kuroon.Clone do
  Application.ensure_all_started(:porcelain)
	use Mix.Task
	
  @doc "Kuroon.clone/1"
	def run([repo_from, repo_to]) do
		Kuroon.clone(repo_from, repo_to)
	end
end
