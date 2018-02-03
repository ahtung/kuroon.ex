defmodule Mix.Tasks.Kuroon.Clone do
  Application.ensure_all_started(:porcelain)
	use Mix.Task

  alias Porcelain.Result
	
  @doc "start task"
	def run([repo_from, repo_to]) do
		Kuroon.clone(repo_from, repo_to)
	end
end
