defmodule AshUnionIssueWeb.IssueLiveTest do
  use AshUnionIssueWeb.ConnCase
  import Phoenix.LiveViewTest

  test "WHEN: A user tries to submit a respo, THEN: The user is redirected to the landing page", %{conn: conn} do
    {:ok, view, _html} = live(conn, ~p"/issue")

    view
    |> form("form", form: %{"children" => %{"0" => %{"response" => "Response"}}})
    |> put_submitter("button[name=submit]")
    |> render_submit()

    assert_redirect(view, ~p"/")
  end
end
