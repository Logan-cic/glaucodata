defmodule GlaucodataWeb.CadastroLive do
  use GlaucodataWeb, :live_view

  alias Glaucodata.Patients.Patient
  alias Glaucodata.Patients


  def mount(_params, _session, socket) do
    {:ok,
     assign(socket, form: to_form(%{}))}
  end

  def render(assigns) do
    ~H"""
    <.form for={@form} phx-submit="proximo">
      <%!-- <.input field={@form[:add_amount]} value={@form.params.adding_amount_default}/> --%>
      <div>
        <.label>numero do cartão do sus</.label>
        <.input field={@form[:cns]} value="7777" />
      </div>

      <div>
        <.label>numero do prontuario</.label>
        <.input field={@form[:medical_record]} value="7777" />
      </div>

      <div>
        <.label>Nome completo do Paciente</.label>
        <.input field={@form[:patient_name]} value="jubileu da silva" />
      </div>

      <div>
        <.label>Nome completo da mãe</.label>
        <.input field={@form[:mother_name]} value="jubiscleusa da silva" />
      </div>

      <div>
        <.label>Nome completo do pai</.label>
        <.input field={@form[:father_name]} value="jubiscleuso da silva" />
      </div>

      <div>
        <.label>Cor</.label>
        <.input field={@form[:ethnicity]} value="preto" />
      </div>

      <div>
        <.label>nacionalidade</.label>
        <.input field={@form[:birthplace]} value="brasileiro" />
      </div>

      <div>
        <.label>Estado civil</.label>
        <.input field={@form[:marital_status]} value="encalhado" />
      </div>

      <div>
        <.label>data de nascimento</.label>
        <.input field={@form[:date_of_birth]} value="2000-09-06" />
      </div>

      <div>
        <.label>Numero de telefone</.label>
        <.input field={@form[:phone_number]} value="00 000000000" />
      </div>

      <div>
        <.label>Profissão</.label>
        <.input field={@form[:occupation]} value="dev" />
      </div>

      <div>
        <.label>escolaridade</.label>
        <.input field={@form[:education_level]} value="ensino superior" />
      </div>

      <div>
        <.label>endereço</.label>
        <.input field={@form[:address]} value="alameda presidente medici"/>
      </div>

      <div>
        <.label>Bairro</.label>
        <.input field={@form[:neighborhood]} value="cidade nova" />
      </div>

      <div>
        <.label>Numero da casa</.label>
        <.input field={@form[:house_number]} value="72" />
      </div>

      <div>
        <.label>CEP</.label>
        <.input field={@form[:cep]} value="00000000" />
      </div>

      <div>
        <.label>cidade</.label>
        <.input field={@form[:city]} value="ananindeua" />
      </div>

      <div>
        <.label>Estado</.label>
        <.input field={@form[:state]} value="PA" />
      </div>
      <.button>Adicionar Paciente</.button>
    </.form>
    """
  end

  def handle_event(
        "proximo",
        %{
          "cns" => cns,
          "medical_record" => medical_record,
          "patient_name" => patient_name,
          "mother_name" => mother_name,
          "father_name" => father_name,
          "ethnicity" => ethnicity,
          "birthplace" => birthplace,
          "marital_status" => marital_status,
          "date_of_birth" => date_of_birth,
          "phone_number" => phone_number,
          "occupation" => occupation,
          "education_level" => education_level,
          "address" => address,
          "neighborhood" => neighborhood,
          "house_number" => house_number,
          "cep" => cep,
          "city" => city,
          "state" => state
        } = params,
        socket
      ) do

    cns = String.to_integer(cns)
    house_number = String.to_integer(house_number)

    changeset = %{
      cns: cns,
      medical_record: medical_record,
      patient_name: patient_name,
      mother_name: mother_name,
      father_name: father_name,
      ethnicity: ethnicity,
      birthplace: birthplace,
      marital_status: marital_status,
      date_of_birth: date_of_birth,
      phone_number: phone_number,
      occupation: occupation,
      education_level: education_level,
      address: address,
      neighborhood: neighborhood,
      house_number: house_number,
      cep: cep,
      city: city,
      state: state
    }
    IO.inspect(Patient.changeset(changeset))
    IO.inspect(Patients.create_patient(changeset))
    {:noreply, assign(socket, from: to_form(params))}
  end
end
