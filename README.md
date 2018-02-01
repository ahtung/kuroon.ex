# Kuroon

[![Build Status](https://travis-ci.org/ahtung/kuroon.ex.svg?branch=master)](https://travis-ci.org/ahtung/kuroon.ex)
[![Coverage Status](https://coveralls.io/repos/ahtung/kuroon.ex/badge.svg?branch=master)](https://coveralls.io/r/ahtung/kuroon.ex?branch=master)
[![Hex.pm version](https://img.shields.io/hexpm/v/kuroon.svg?style=flat-square)](https://hex.pm/packages/kuroon)
[![Hex.pm downloads](https://img.shields.io/hexpm/dt/kuroon.svg)](https://hex.pm/packages/kuroon)

Cloning will enable mankind to reach eternal life.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `kuroon` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:kuroon, "~> 0.1.0"}
  ]
end
```

## Usage
Using ```clone()```function


```elixir
# Kuroon.clone(repo_from, repo_to, remote_name)
iex(1)> Kuroon.clone("ahtung/kuroon_test_from", "ahtung/kuroon_test_to", "origin")
```

Using mix task

```
# mix kuroon.clone repo_from, repo_to, remote_name
$ mix kuroon.clone ahtung/kuroon_test_from ahtung/kuroon_test_to origin
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/kuroon](https://hexdocs.pm/kuroon).
