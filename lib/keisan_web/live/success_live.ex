defmodule KeisanWeb.SuccessLive do
  use KeisanWeb, :live_view

  def mount(_params, _session, _socket) do
    {
      :ok
    }
  end

  def render(assigns) do
    ~L"""
    <h1>Success Live!</h1>
    """
  end

  def handle_event("guess", %{"number" => guess, "goal" => goal}=data, socket) do
    IO.inspect data

    message = case guess == goal do
      true -> "Your guess: #{guess}. Congratz! 🎉. Start over. "
      false -> "Your guess: #{guess}. Wrong. Guess again. "
    end

    score = socket.assigns.score - 1

    {
      :noreply,
      assign(
        socket,
        message: message,
        score: score
      )
    }
  end
end
