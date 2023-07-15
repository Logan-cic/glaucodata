defmodule Glaucodata.Patient do
  use Ecto.Schema
  import Ecto.Changeset

  alias Glaucodata.Diagnostic
  alias Glaucodata.Treatment

  @primary_key {:CNS, :integer, autogenerate: false}

  @fields [:CNS, :medical_record, :patient_name, :mother_name, :father_name,
           :ethnicity, :birthplace, :marital_status, :date_of_birth,
           :phone_number, :occupation, :education_level, :address,
           :neighborhood, :house_number, :CEP, :city, :state]

  @required_fields [:CNS, :medical_record, :patient_name, :mother_name, :father_name, :phone_number, :CEP]

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
    field :CEP, :string
    field :city, :string
    field :state, :string

    has_many :treatments, Treatment, foreign_key: :patient_cns
    has_one :diagnostic, Diagnostic, foreign_key: :patient_cns

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @fields)
    |> validate_required(@required_fields)
  end
end
