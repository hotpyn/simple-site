defmodule Helloplug.Email do
  import Bamboo.Email

  def welcome_email(recipient, msg) do
    new_email(
      to: recipient,
      from: "form@example.com",
      subject: "Registration for my site",
      html_body: msg,
      text_body: msg
    )
  end

end

