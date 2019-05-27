defmodule Demo do

  def reverse do
    receive do
      { from_pid, msg } ->
        IO.inspect from_pid
        result = msg |> String.reverse
        send from_pid, result
        reverse()
    end
  end

  def reverse_init do
    receive do
      msg ->
        result = msg |> String.reverse
        IO.puts result
        reverse_init()
    end

  end
end
