defmodule Glaucodata.Repo.Migrations.CreatePatients do
  use Ecto.Migration

  def change do
    create table(:patients, primary_key: false) do
      add :cns, :integer, primary_key: true
      add :medical_record, :string, null: false
      add :patient_name, :string
      add :mother_name, :string
      add :father_name, :string
      add :ethnicity, :string
      add :birthplace, :string
      add :marital_status, :string
      add :date_of_birth, :date
      add :phone_number, :string
      add :occupation, :string
      add :education_level, :string
      add :address, :string
      add :neighborhood, :string
      add :house_number, :integer
      add :cep, :string
      add :city, :string
      add :state, :string

      timestamps()
    end

    create unique_index(:patients, [:cns])
    create unique_index(:patients, [:medical_record])
  end
end
