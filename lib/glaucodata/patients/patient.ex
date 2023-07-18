defmodule Glaucodata.Patients.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glaucodata.Diagnostics.Diagnostic
  alias Glaucodata.Treatments.Treatment

  @primary_key {:cns, :integer, autogenerate: false}

  @fields [:cns, :medical_record, :patient_name, :mother_name, :father_name,
  :ethnicity, :birthplace, :marital_status, :date_of_birth,
  :phone_number, :occupation, :education_level, :address,
  :neighborhood, :house_number, :cep, :city, :state]

  @required_fields [:cns, :medical_record, :patient_name, :mother_name, :father_name, :phone_number, :cep]

  schema "patients" do
    field :medical_record, :string
    field :patient_name, :string
    field :mother_name, :string
    field :father_name, :string
    field :ethnicity, :string
    field :birthplace, :string
    field :marital_status, :string
    field :date_of_birth, :date
    field :phone_number, :string
    field :occupation, :string
    field :education_level, :string
    field :address, :string
    field :neighborhood, :string
    field :house_number, :integer
    field :cep, :string
    field :city, :string
    field :state, :string

    has_one :diagnostics, Diagnostic, foreign_key: :patient_cns
    has_many :treatments, Treatment, foreign_key: :patient_cns

    timestamps()
  end

  def changeset(patient, attrs) do
    patient
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end
end
