defmodule Glaucodata.Diagnostic do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glaucodata.Patient

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  @fields [:id, :glaucoma_type, :glaucoma_severity, :previous_surgeries, :patient_cns]

  @required_fields [:glaucoma_type, :glaucoma_severity, :previous_surgeries, :patient_cns]

  schema "diagnostics" do
    field :glaucoma_type, :string
    field :glaucoma_severity, :string
    field :previous_surgeries, :string
    belongs_to :patient, Patient, foreign_key: :patient_cns, references: :CNS

    timestamps()
  end

  def changeset(params) do

    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@required_fields)
    # params =
    #   params
    #   |> Map.put(:patient_cns, to_string(params.patient_cns))
    # params
  end

end
