require 'berlin-ai'
require_relative 'move'

class Berlin::AI::Player
  def self.on_turn(game)
    mover = PossibleMove.new(game)
    mover.make_moves
    game
  end
end
