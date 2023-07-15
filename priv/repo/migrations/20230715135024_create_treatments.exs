defmodule Glaucodata.Repo.Migrations.CreateTreatments do
  use Ecto.Migration

  def change do
    create table(:treatments, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :eye_drops, :string
      add :last_consultation_date, :date
      add :last_campimetry_date, :date
      add :last_retinography_date, :date
      add :last_OCT_date, :date
      add :last_gonioscopy_date, :date
      add :neuropathy_progression, :string

      add :patient_cns, references(:patients, column: :CNS, type: :integer)

      timestamps()
    end
  end
end
