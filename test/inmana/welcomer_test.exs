defmodule Inmana.WelcomerTest do
  use ExUnit.Case
  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user is especial, returns a especial message" do
      params = %{"name" => "banana", "age" => "42"}

      result = Welcomer.welcome(params)
      expected_result = {:ok, "You are very special banana"}
      assert result == expected_result
    end

    test "when the user is not especial, returns a welcome message" do
      params = %{"name" => "banana", "age" => "40"}
      result = Welcomer.welcome(params)
      expected_result = {:ok, "Welcome banana"}
      assert result == expected_result
    end

    test "when the user is under age, returns an error" do
      params = %{"name" => "banana", "age" => "17"}
      result = Welcomer.welcome(params)
      expected_result = {:error, "You shall not pass banana"}
      assert result == expected_result
    end
  end
end
