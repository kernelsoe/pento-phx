defmodule KeisanWeb.PageController do
  use KeisanWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
