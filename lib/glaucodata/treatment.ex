defmodule Glaucodata.Treatment do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glaucodata.Patient

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @fields [:id, :eye_drops, :last_consultation_date, :last_campimetry_date, :last_retinography_date,
           :last_OCT_date, :last_gonioscopy_date, :neuropathy_progression, :patient_cns]

  @required_fields [:eye_drops, :patient_cns]

  schema "treatments" do
    field :eye_drops, :string
    field :last_consultation_date, :date
    field :last_campimetry_date, :date
    field :last_retinography_date, :date
    field :last_OCT_date, :date
    field :last_gonioscopy_date, :date
    field :neuropathy_progression, :string

    belongs_to :patient, Patient, foreign_key: :patient_cns, references: :CNS

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}

    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end

end
