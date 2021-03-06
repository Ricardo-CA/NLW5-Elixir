defmodule Inmana.RestaurantTest do
  use Inmana.DataCase
  alias Inmana.Restaurant
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{name: "Siri cascudo", email: "siri@cascudo.com"}

      response = Restaurant.changeset(params)

      assert %Changeset{
               changes: %{
                 email: "siri@cascudo.com",
                 name: "Siri cascudo"
               },
               valid?: true
             } = response
    end
  end

  test "when there are invalid params, returns a valid changeset" do
    params = %{name: "i", email: ""}

    expected_response = %{email: ["can't be blank"], name: ["should be at least 2 character(s)"]}

    response = Restaurant.changeset(params)

    assert %Changeset{valid?: false} = response

    assert errors_on(response) == expected_response
  end
end
