defmodule GlaucodataWeb.CadastroLive do
  use Phoenix.LiveView

  alias Glaucodata.Patients.Patient

  def mount(_params, _session, socket) do
    changeset = Patient.changeset(%Patient{})

    {:ok, assign(socket, changeset: changeset)}
  end

  
end


# def mount(_params, _session, socket) do
#   socket =
#     socket
#     |> assign(:counter, 0)
#   {:ok, socket}
# end

# def handle_event("aumentar", _params, socket) do
#   socket =
#     socket
#     |>assign(:counter, socket.assigns.counter + 1)
#   {:noreply, socket}
# end

# def handle_event("diminuir", _params, socket) do
#   socket =
#     socket
#     |>assign(:counter, socket.assigns.counter - 1)
#   {:noreply, socket}
# end

# def render(assigns) do
#   ~H"""
#     <div class="flex justify-center items-center h-screen">
#       <div>
#         <p class="text-center">pikas chupadas <%=@counter%></p>
#         <button class="rounded-full bg-green-500 text-white px-4 py-2" phx-click="aumentar">Aumentar +</button>
#         <button class="rounded-full bg-green-500 text-white px-4 py-2" phx-click="diminuir">Diminuir -</button>
#         <label for="sus-input">Carteira Nacional do SUS:</label>
#         <input type="text" id="sus-input" name="sus" placeholder="Digite o número da CNS"/>
#       </div>
#     </div>
#    """
# end
