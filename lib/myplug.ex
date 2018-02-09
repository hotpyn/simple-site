defmodule Myplug do

  def init(default_opts) do
    IO.puts "starting up Helloplug..."
    default_opts
  end

  def call(conn, _opts) do
    IO.puts "here again"
    route(conn.method, conn.path_info, conn)
  end

  def route("POST", ["elixir", "form"], conn) do
    {:ok ,body,_} = Plug.Conn.read_body(conn)
    body=body |> Plug.Conn.Query.decode
    IO.inspect body
    first=body["firstname"]
    last=body["lastname"]
    email=body["email"]
    {:ok, file} = File.open "save", [:append]
    IO.puts file, email
    IO.puts file, "First:\t"<>first
    IO.puts file, "Last:\t"<>last
    IO.puts file, "\n"
    File.close file

    msg="Dear "<>first<>" "<>last<>",<p>Thank you for registering."

    Helloplug.Email.welcome_email(email,msg) |> Helloplug.Mailer.deliver_later

    conn |> Plug.Conn.send_resp(200, "Hello "<>first<>" "<>last<>", Thank you for registering. Expect an email from us.")
  end

  def route(_method, _path, conn) do
    # this route is called if no other routes match
        conn |> IO.inspect
  conn |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
end

end

