defmodule KeisanWeb.PageLive do
  use KeisanWeb, :live_view

  @upper_limit 10

  def mount(_params, _session, socket) do
    {
      :ok,
      assign(
        socket,
        message: "Guess a number",
        score: 0,
        number: randam_num(),
        time: time(),
      )
    }
  end

  def render(assigns) do
    ~L"""
    <h1>Your score: <%= @score %></h1>
    <h2>
      <%= @message %>
    </h2>

    <pre>Goal: <%= @number %></pre>

    <h2>
      <%= for n <- 1..10 do %>
        <a href="#" phx-click="guess" phx-value-number="<%= n %>"><%= n %></a>
      <% end %>
    </h2>

    <a href="#" phx-click="reset_game" phx-value-x="xxx">Reset</a>
    """
  end

  def time(), do: DateTime.utc_now() |> to_string()

  def randam_num(), do: Enum.random(1..@upper_limit) |> to_string()

  def handle_event("guess", %{"number" => guess}=data, socket) do
    IO.inspect data
    cond do
      guess == socket.assigns.number ->
        message = "Your guess: #{guess}. Congratz! 🎉."
        score = socket.assigns.score + 10
        {
          :noreply,
          assign(
            socket,
            message: message,
            score: score,
            number: randam_num(),
            time: time()
          )
        }
      true ->
        message = "Your guess: #{guess}. Wrong. Guess again. "
        score = socket.assigns.score - 1
        {
          :noreply,
          assign(
            socket,
            message: message,
            score: score,
            number: randam_num(),
            time: time()
          )
        }
    end
  end

  def handle_event("reset_game", data, socket) do
    IO.inspect(data)
    {
      :noreply,
      assign(
        socket,
        score: 0,
        number: randam_num(),
        time: time()
      )
    }
  end
end
