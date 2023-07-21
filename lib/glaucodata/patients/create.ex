defmodule Glaucodata.Patients.Create do
  alias Glaucodata.Patients.Patient
  alias Glaucodata.Repo

  def call(params) do
    params
    |> Patient.changeset()
    |> Repo.insert()
  end
end
