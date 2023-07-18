defmodule Glaucodata.Treatments.Treatment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glaucodata.Patients.Patient

  @fields [:id, :eye_drops, :last_consultation_date, :last_campimetry_date, :last_retinography_date,
  :last_OCT_date, :last_gonioscopy_date, :neuropathy_progression, :patient_cns]

  @required_fields [:eye_drops, :patient_cns]

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @derive {Jason.Encoder, only: @fields}

  schema "treatments" do
    field :eye_drops, :string
    field :last_consultation_date, :date
    field :last_campimetry_date, :date
    field :last_retinography_date, :date
    field :last_OCT_date, :date
    field :last_gonioscopy_date, :date
    field :neuropathy_progression, :string

    belongs_to :patients, Patient, foreign_key: :patient_cns, references: :cns

    timestamps()
  end

  def changeset(treatment, attrs) do
    treatment
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end
end
