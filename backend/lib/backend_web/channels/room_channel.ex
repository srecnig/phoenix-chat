defmodule BackendWeb.RoomChannel do
  use Phoenix.Channel
  require Logger

  def join("room:lobby", message, socket) do
    Process.flag(:trap_exit, true)
    send(self(), {:after_join, message})
    {:ok, socket}
  end

  def join("room:" <> private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized for #{private_room_id}"}}
  end

  def handle_info({:after_join, message}, socket) do
    broadcast! socket, "new_join", %{}
    {:noreply, socket}
  end

  def handle_in("new_msg", %{"body" => body}, socket) do
    broadcast! socket, "new_msg", %{body: body}
    {:noreply, socket}
  end

  def terminate(reason, socket) do
    broadcast! socket, "new_leave", %{}
    Logger.debug"> leave  #{inspect reason}"
    :ok
  end
end
