defmodule Glaucodata.Repo.Migrations.CreateDiagnosticsTable do
  use Ecto.Migration

  def change do
    create table(:diagnostics, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :glaucoma_type, :string
      add :glaucoma_severity, :string
      add :previous_surgeries, :string
      
      add :patient_cns, references(:patients, column: :CNS, type: :integer)

      timestamps()
    end
  end
end
