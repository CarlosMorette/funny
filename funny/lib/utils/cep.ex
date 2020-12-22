defmodule Funny.Cep do
  alias Funny.Viacep

  def browse(cep) do
    with true <- String.length(cep) == 8,
         {:ok, response} <- Viacep.get(cep),
         {:ok, data} <- response.body |> Jason.decode(),
         do: data
  end
end
