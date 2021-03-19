# frozen_string_literal: true

class Game
  attr_accessor :points_won 

# exposed!, could be read only 
# on the way to refactoring tests....(reduce calls to the method point_to, othrwise reader would be fine  )


  def initialize(server, receiver)
    @server = server
    @receiver = receiver
    @points_won = []
  end

  def point_to(player)
    @points_won << player
# could also use push

  end

  def score
    tally = @points_won.tally
    server_score = score_translate[tally[@server]]
    receiver_score = score_translate[tally[@receiver]]
# string represrantation


    # TODO - Refactor conditionals with case statement or Guard clauses e.g.
    # return "Score: Advantage, #{@server}" if tally[@server] == 4 && tally[@receiver] == 3
    
    if tally[@server] == 4 && tally[@receiver] == 3
      return "Score: Advantage, #{@server}"
    elsif tally[@receiver] == 4 && tally[@server] == 3
      return "Score: Advantage, #{@receiver}"
    end
    
  # if a player has a advantage
   if tally[@server] == 5 && tally[@receiver] == 3
      return "Score: Game, #{@server}"
    elsif tally[@receiver] == 5 && tally[@server] == 3
      return "Score: Game, #{@receiver}"
    end

    return 'Score: deuce' if tally[@server] >= 3 && tally[@receiver] >= 3

    "Score: #{server_score}, #{receiver_score.downcase}"
    # rule5
  end

  private
# Used internally only

  def score_translate
    # hash with numbered key
    {
      0 => 'Love',
      1 => 'Fifteen',
      2 => 'Thirty',
      3 => 'Forty'
    }
    # .freeze as a constant (for efficiency)? 
  end
end
