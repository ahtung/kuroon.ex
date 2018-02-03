defmodule KuroonTest do
  use ExUnit.Case
  doctest Kuroon
  
  describe "Kuroon.clone/2" do
    test "non existing from repo" do
      assert elem(Kuroon.clone("non_existing", "ahtung/kuroon_test_to"), 0) == :error
    end
    
    test "non existing to repo" do
      assert elem(Kuroon.clone("ahtung/kuroon_test_from", "non_existing"), 0) == :error
    end
    
    test "empty from repo" do
      assert elem(Kuroon.clone("", "ahtung/kuroon_test_to"), 0) == :error
    end
    
    test "empty to repo" do
      assert elem(Kuroon.clone("ahtung/kuroon_test_from", ""), 0) == :error
    end
  end
end
