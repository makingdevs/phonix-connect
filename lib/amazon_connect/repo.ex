defmodule AmazonConnect.Repo do
  use Ecto.Repo,
    otp_app: :amazon_connect,
    adapter: Ecto.Adapters.Postgres
end
