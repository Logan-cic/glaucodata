defmodule Glaucodata.Diagnostics.Diagnostic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glaucodata.Patients.Patient

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @fields [:id, :glaucoma_type, :glaucoma_severity, :previous_surgeries, :patient_cns]

  @required_fields [:glaucoma_type, :glaucoma_severity, :previous_surgeries, :patient_cns]

  @derive {Jason.Encoder, only: @fields}

  schema "diagnostics" do
    field :glaucoma_type, :string
    field :glaucoma_severity, :string
    field :previous_surgeries, :string

    belongs_to :patients, Patient, foreign_key: :patient_cns, references: :cns

    timestamps()
  end

  def changeset(diagnostics, attrs) do
    diagnostics
    |> cast(attrs, @fields)
    |> validate_required(@required_fields)
  end

end
