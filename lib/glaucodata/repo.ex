defmodule Glaucodata.Repo do
  use Ecto.Repo,
    otp_app: :glaucodata,
    adapter: Ecto.Adapters.Postgres
end
