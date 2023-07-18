defmodule Glaucodata.PatientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Glaucodata.Patients` context.
  """

  @doc """
  Generate a patient.
  """
  def patient_fixture(attrs \\ %{}) do
    {:ok, patient} =
      attrs
      |> Enum.into(%{
        cns: 42
      })
      |> Glaucodata.Patients.create_patient()

    patient
  end
end
