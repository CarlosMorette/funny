defmodule Funny.ErrorMessage do
  def error_message(message \\ "") do
    {:ok, response} = %{error: message} |> Jason.encode()
    response
  end
end
