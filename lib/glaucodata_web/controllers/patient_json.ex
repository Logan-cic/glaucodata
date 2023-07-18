defmodule GlaucodataWeb.PatientJSON do
  alias Glaucodata.Patients.Patient

  @doc """
  Renders a list of patients.
  """
  def index(%{patients: patients}) do
    %{patient: for(patient <- patients, do: data(patient))}
  end

  @doc """
  Renders a single patient.
  """
  def show(%{patient: patient}) do
    %{patient: data(patient)}
  end

  defp data(%Patient{} = patient) do
  patient = Glaucodata.Repo.preload(patient, [:diagnostics, :treatments])
    %{
      cns: patient.cns,
      medical_record: patient.medical_record,
      patient_name: patient.patient_name,
      mother_name: patient.mother_name,
      father_name: patient.father_name,
      ethnicity: patient.ethnicity,
      birthplace: patient.birthplace,
      marital_status: patient.marital_status,
      date_of_birth: patient.date_of_birth,
      phone_number: patient.phone_number,
      occupation: patient.occupation,
      education_level: patient.education_level,
      address: patient.address,
      neighborhood: patient.neighborhood,
      house_number: patient.house_number,
      cep: patient.cep,
      city: patient.city,
      state: patient.state,
      diagnostics: patient.diagnostics,
      treatments: patient.treatments
    }
  end
end
