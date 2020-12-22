defmodule Funny.Router do
  use Plug.Router
  alias Funny.Cep
  alias Funny.ErrorMessage

  plug(:match)
  plug(:dispatch)

  get "/:cep" do
    cep_param = String.split(cep, "=") |> Enum.at(1)

    case cep_param |> String.length() do
      8 ->
        case Cep.browse(cep_param) |> Jason.encode() do
          {:ok, data} -> send_resp(conn, 200, data)
        end

      _ ->
        send_resp(conn, 400, ErrorMessage.error_message("Invalid Cep"))
    end
  end

  match _ do
    send_resp(conn, 404, ErrorMessage.error_message("Invalid route"))
  end
end
