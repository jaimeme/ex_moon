defmodule ExMoon.Player do
  # usar o @enforce_keys pra definir quais chaves sao obrigatorias

  # Quando se tem valores que nao se mudam, como a "life", utiliza-se variaveis de modulo,
  # ou seja, foi trocado 100 pelo @max_life e o required_keys tambem foi trocado
  # pq ele sempre espera  os mesmos valores, mas quando for buildado que vai ser mudado
  # required_keys = [:life, :name, :move_rnd, :move_avg, :move_heal]
  @required_keys [:life, :moves, :name]
  @max_life 100

  @enforce_keys @required_keys

  defstruct @required_keys

  def build(name, move_rnd, move_avg, move_heal) do
    %ExMoon.Player{
      life: @max_life,
      moves: %{
        move_avg: move_avg,
        move_heal: move_heal,
        move_rnd: move_rnd
      },
      name: name
    }
  end
end
