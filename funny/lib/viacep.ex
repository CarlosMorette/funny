defmodule Funny.Viacep do
  use HTTPoison.Base

  def process_url(url) do
    endpoint = &"https://viacep.com.br/ws/#{&1}/json/"
    endpoint.(url)
  end
end
