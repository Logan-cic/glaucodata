defmodule GlaucodataWeb.CadastroLive do
  use GlaucodataWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, number: 0, form: to_form(%{}))}
  end

  def render(assigns) do
    ~H"""
      <%= @number%>
      <.button phx-click="add">Add</.button>

      <.simple_form for={@form} phx-submit="adding_more">
        <.input field={@form[:add_amount]} value="5"/>
        <.button>Add More</.button>
      </.simple_form>
    """
  end

  def handle_event("add", _unsigned_params, socket) do
    {:noreply, assign(socket, number: socket.assigns.number + 1)}
  end

  def handle_event("adding_more", %{"add_amount" => the_added_amount}, socket) do
    {number, _} = Integer.parse(the_added_amount)
    {:noreply, assign(socket, number: socket.assigns.number + number)}
  end

end
