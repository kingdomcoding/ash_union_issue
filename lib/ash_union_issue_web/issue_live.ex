defmodule AshUnionIssueWeb.IssueLive do
  use AshUnionIssueWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, resource} = AshUnionIssueWeb.Domain.create_parent(%{children: [%{type: "one_of_the_children", prompt: "Prompt"}]})

    socket = assign(socket, :form, AshPhoenix.Form.for_update(resource, :update, domain: AshUnionIssueWeb.Domain, forms: [auto?: true]))
    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.form :let={f} for={@form} phx-change="validate" phx-submit="submit">
      <.inputs_for :let={ff} field={f[:children]}>
        <%= case ff.data do %>
          <% %AshUnionIssueWeb.Resources.OneOfTheChildren{} -> %>
            <.input field={ff[:prompt]} value={ff.data.prompt} />
            <.input field={ff[:response]} label={ff.data.prompt} />
        <% end %>
      </.inputs_for>

      <.button type="submit" name="submit">Proceed</.button>
    </.form>
    """
  end

  def handle_event("validate", params, socket) do
    form_params = Map.get(params, "form", %{})
    validated_form = AshPhoenix.Form.validate(socket.assigns.form, form_params, errors: socket.assigns.form.errors || false)
    {:noreply, assign(socket, form: validated_form)}
  end

  @impl true
  def handle_event("submit", %{"form" => form_params}, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form, params: form_params) do
      {:ok, resource} ->
        IO.inspect(resource, label: "Resource")
        {:noreply, push_navigate(socket, to: ~p"/")}

      {:error, form_with_error} ->
        IO.inspect(form_with_error, label: "Form with error")
        {:noreply, assign(socket, form: form_with_error)}
    end
  end

end
