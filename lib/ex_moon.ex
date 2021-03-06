defmodule ExMoon do
  # Utilizando o Alias, nao sera preciso chamar ExMoon.Player.build, ele vai considerar o ultimo sendo ele "Player" como ExMoon.Player, assim evitando de escrever tudo caso fique muito grande
  alias ExMoon.{Game, Player}
  alias ExMoon.Game.{Status, Actions}

  @computer_name "Robotinik"

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

  def start_game(player) do
    # computer = create_player("Robotinik", :punch, :kick, :heal)
    # Game.start(computer, player)
    @computer_name
    |> create_player(:punch, :kick, :heal)
    |> Game.start(player)

    Status.print_round_message()
  end

  def make_move(move) do
    move
    |> Actions.fetch_move()
    |> do_move()
  end

  defp do_move({:error, move}), do: Status.print_wrong_move_message(move)

  defp do_move({:ok, move}) do
    case move do
      :move_heal -> "realiza_cura"
      move -> Actions.attack(move)
    end
  end
end

# player = ExMoon.create_player("Jaime", :chute, :soco, :cura)
# ExMoon.start_game(player)
