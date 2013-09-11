class PossibleMove
  def initialize game
    @game = game
  end

  def make_moves
    @game.map.owned_nodes.each do |node|
      node.adjacent_nodes.each do |adjacent_node|
        move_if_free(node, adjacent_node) and next

        if adjacent_node.owned?
          supply(node, adjacent_node) and next
        else
          attack_if_weaker(node, adjacent_node) and next
        end
      end
    end
  end

  def supply(current_node, target_node)
    if current_node.available_soldiers >= 2
      @game.add_move(current_node, target_node, current_node.available_soldiers/2 )
      return true
    end
  end

  def attack_if_weaker(current_node, target_node)
    if target_node.number_of_soldiers > current_node.available_soldiers
      @game.add_move(current_node, target_node, current_node.available_soldiers) 
      return true
    end
  end

  def move_if_free(current_node, target_node)
    if target_node.free? and current_node.available_soldiers >= 2
      @game.add_move(current_node, target_node, current_node.available_soldiers / 2 )
      return true
    end
  end

end