defmodule GestoqueWeb.PageController do
  use GestoqueWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
