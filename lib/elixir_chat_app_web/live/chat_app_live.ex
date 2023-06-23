defmodule ElixirChatAppWeb.ChatAppLive do
  use ElixirChatAppWeb, :live_view

  def mount(_params, session, socket) do
    username = Map.get(session, "username")
    IO.inspect(username)
    socket = socket
    |> assign(:username, username)
    |> assign(:messages, get_messages())
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="chat-container">
      <div class="chat-messages" id="chat-messages" phx-hook="ScrollToBottom">
        <!-- Chat messages will be dynamically added here -->
        <%= for message <- @messages do %>
          <div class="chat-message">
            <div class="chat-message-author"><%= message.m_author %></div>
            <div class="chat-message-text"><%= message.m_text %></div>
          </div>
        <% end %>
      </div>
      <form class="chat-input" phx-submit="submit">
        <input type="text" id="message-input" placeholder="Type your message" name="message" autofocus>
        <button id="send-button">Send</button>
      </form>
    </div>
    """
  end

  def handle_event("submit", payload, socket) do
    m_text = Map.get(payload, "message")
    m_author = socket.assigns.username
    # IO.inspect(payload)
    # IO.inspect(%{m_text: m_text, m_author: m_author})
    if m_text && m_author do
      message = ElixirChatApp.create_message(%{m_text: m_text, m_author: m_author})
      # Use assign/3 to update the messages list with the new message
      socket =
        socket
        |> assign(messages: [message | get_messages()])
        |> push_event("scroll_to_bottom", %{})
      {:noreply, socket}
    else
      {:noreply, socket}
    end
  end

  defp get_messages() do
    case ElixirChatApp.list_messages() do
      {:ok, messages} -> messages
      _ -> []
    end
  end
end
