defmodule GlaucodataWeb.PatientController do
  use GlaucodataWeb, :controller

  alias Glaucodata.Patients
  alias Glaucodata.Patients.Patient

  action_fallback GlaucodataWeb.FallbackController

  def index(conn, _params) do
    patients = Patients.list_patients()
    render(conn, :index, patients: patients)
  end

  def create(conn, %{"patient" => patient_params}) do
    with {:ok, %Patient{} = patient} <- Patients.create_patient(patient_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/patients/#{patient}")
      |> render(:show, patient: patient)
    end
  end

  def show(conn, %{"id" => cns}) do
    patient = Patients.get_patient!(cns)
    render(conn, :show, patient: patient)
  end


  def update(conn, %{"cns" => cns, "patient" => patient_params}) do
    patient = Patients.get_patient!(cns)
    with {:ok, %Patient{} = patient} <- Patients.update_patient(patient, patient_params) do
      render(conn, :show, patient: patient)
    end
  end

  def delete(conn, %{"cns" => cns}) do
    patient = Patients.get_patient!(cns)
    with {:ok, %Patient{}} <- Patients.delete_patient(patient) do
      send_resp(conn, :no_content, "")
    end
  end
end
