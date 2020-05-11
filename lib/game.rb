
class Game
  attr_accessor :round, :all_cards, :challenger1, :challenger2, :peace

  def initialize

    @round = 0

    @all_cards =[
    card1 = Card.new(:heart, 'Ace', 14),
    card2 = Card.new(:heart, '2', 2),
    card3 = Card.new(:heart, '3', 3),
    card4 = Card.new(:heart, '4', 4),
    card5 = Card.new(:heart, '5', 5),
    card6 = Card.new(:heart, '6', 6),
    card7 = Card.new(:heart, '7', 7),
    card8 = Card.new(:heart, '8', 8),
    card9 = Card.new(:heart, '9', 9),
    card10 = Card.new(:heart, '10', 10),
    card11 = Card.new(:heart, 'Jack', 11),
    card12 = Card.new(:heart, 'Queen', 12),
    card13 = Card.new(:heart, 'King', 13),
    card14 = Card.new(:spade, 'Ace', 14),
    card15 = Card.new(:spade, '2', 2),
    card16 = Card.new(:spade, '3', 3),
    card17 = Card.new(:spade, '4', 4),
    card18 = Card.new(:spade, '5', 5),
    card19 = Card.new(:spade, '6', 6),
    card20 = Card.new(:spade, '7', 7),
    card21 = Card.new(:spade, '8', 8),
    card22 = Card.new(:spade, '9', 9),
    card23 = Card.new(:spade, '10', 10),
    card24 = Card.new(:spade, 'Jack', 11),
    card25 = Card.new(:spade, 'Queen', 12),
    card26 = Card.new(:spade, 'King', 13),
    card27 = Card.new(:diamond, 'Ace', 14),
    card28 = Card.new(:diamond, '2', 2),
    card29 = Card.new(:diamond, '3', 3),
    card30 = Card.new(:diamond, '4', 4),
    card31 = Card.new(:diamond, '5', 5),
    card32 = Card.new(:diamond, '6', 6),
    card33 = Card.new(:diamond, '7', 7),
    card34 = Card.new(:diamond, '8', 8),
    card35 = Card.new(:diamond, '9', 9),
    card36 = Card.new(:diamond, '10', 10),
    card37 = Card.new(:diamond, 'Jack', 11),
    card38 = Card.new(:diamond, 'Queen', 12),
    card39 = Card.new(:diamond, 'King', 13),
    card40 = Card.new(:club, 'Ace', 14),
    card41 = Card.new(:club, '2', 2),
    card42 = Card.new(:club, '3', 3),
    card43 = Card.new(:club, '4', 4),
    card44 = Card.new(:club, '5', 5),
    card45 = Card.new(:club, '6', 6),
    card46 = Card.new(:club, '7', 7),
    card47 = Card.new(:club, '8', 8),
    card48 = Card.new(:club, '9', 9),
    card49 = Card.new(:club, '10', 10),
    card50 = Card.new(:club, 'Jack', 11),
    card51 = Card.new(:club, 'Queen', 12),
    card52 = Card.new(:club, 'King', 13)]

    @pile1 = Deck.new()
    @pile2 = Deck.new()

    @challenger1 = Player.new("Megan", @pile1)
    @challenger2 = Player.new("Aurora", @pile2)
  end

  def shuffle_and_deal

    @all_cards.shuffle!

    cut = @all_cards.each_slice(26).to_a

    @pile1 = cut[0]
    @pile2 = cut[1]

    @pile1.each do |card|

      @challenger1.deck.cards << card
    end

    @pile2.each do |card|

      @challenger2.deck.cards << card
    end
  end

  def welcome

    puts 'Welcome to War! (or Peace)'
    puts'This game will be played with 52 cards.'
    puts 'The players today are Megan and Aurora.'
    puts 'Type \'GO\' to start the game!'
    puts '------------------------------------------------------------------'

    while user_input = gets.chomp.strip.upcase
      case user_input
      when 'GO'



        shuffle_and_deal
        break
      else

        puts 'Invalid input. Please try again.'
        puts '--------------------------------------------------------------'
      end
    end
  end


  def organize_peace

    if @challenger1.has_lost? == true

      p "*~*~*~* #{@challenger2.name} has won the game! *~*~*~*"

      @peace = true
    elsif @challenger2.has_lost? == true

      p "*~*~*~* #{@challenger1.name} has won the game! *~*~*~*"

      @peace = true
    elsif  @round == 1000001

      p "---- DRAW ----"

      @peace = true
    else

      @peace = false
    end
  end



  def start

    while @peace == false
      #code

    end
  end
end
#   def start
#
#     if @round > 10 do
#
#       if @round < 10
#
#         turn = Turn.new(@challenger1, @challenger2)
#
#         if turn.type == :basic
#
#           p "Turn #{@round}: #{turn.winner} won 2 cards"
#
#           winner = turn.winner
#
#
#           turn.pile_cards
#           turn.award_spoils(winner)
#
#         elsif turn.type == :war
#
#           p "Turn #{@round}: WAR - #{turn.winner} won 6 cards"
#
#           winner = turn.winner
#
#
#           turn.pile_cards
#           turn.award_spoils(winner)
#
#         else
#
#           p "Turn #{@round}: *mutually assured destruction* 6 cards were removed from play"
#
#           winner = turn.winner
#
#
#           turn.pile_cards
#           turn.award_spoils(winner)
#         end
#
#
#         if @challenger2.has_lost? == true
#
#           p '*~*~*~* #{@challenger1.name} has won the game! *~*~*~*'
#           break
#         elsif @challenger1.has_lost? == true
#
#           p '*~*~*~* #{@challenger2.name} has won the game! *~*~*~*'
#           break
#         else
#
#           @round += 1
#         end
#     else
#       p '---- DRAW ----'
#       break
#       end
#     end
#   end
