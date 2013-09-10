require 'berlin-ai'

class Berlin::AI::Player
  def self.on_turn(game)
    # Do your magic here.

    # Here's an AI that randomly moves soldiers from node to node.
    game.map.controlled_nodes.each do |node|
      node.adjacent_nodes.shuffle.each do |other_node|
        soldiers = rand(0..(node.available_soldiers))
        game.add_move(node, other_node, soldiers)
      end
    end
  end
end
