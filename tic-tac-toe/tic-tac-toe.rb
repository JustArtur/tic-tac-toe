require 'pry'
class Board
  attr_accessor :board
  def initialize()
    @board = ["-", "-", "-",
              "-", "-", "-",
              "-", "-", "-"]
  end

  def display_board()
    print(board[0], " | ", board[1], " | ", board[2], "\n")
    print(board[3], " | ", board[4], " | ", board[5], "\n")
    print(board[6], " | ", board[7], " | ", board[8], "\n")
  end

  def check_winner()
    if board[0] == board[1] and board[1] == board[2] and board[0] != "-"
      puts(" Выиграл игрок #{board[0]}")
      @winner = false
    elsif board[3] == board[4] and board[4]== board[5] and board[3] != "-"
      puts(" Выиграл игрок #{board[0]}")
      @winner = true
    elsif board[6] == board[7] and board[7] == board[8] and board[6] != "-"
      puts(" Выиграл игрок #{board[0]}")
      @winner = true
    elsif board[0] == board[3] and board[3] == board[6] and board[0] != "-"
      puts(" Выиграл игрок #{board[0]}")
      @winner = true
    elsif board[1] == board[4] and board[4] == board[7] and board[1] != "-"
      puts(" Выиграл игрок #{board[0]}")
      @winner = true
    elsif board[2] == board[5] and board[5] == board[8] and board[2] != "-"
      puts(" Выиграл игрок #{board[0]}")
      @winner = true
    elsif board[0] == board[4] and board[4] == board[8] and board[0] != "-"
      puts(" Выиграл игрок #{board[0]}")
      @winner = true
    elsif board[2] == board[4] and board[4] == board[6] and board[2] != "-"
      puts(" Выиграл игрок #{board[0]}")
      @winner = true
    end
  end

  def change_board(index_of_cells, player)
    if board[index_of_cells] == "-"
      board[index_of_cells] = player
    else
      puts "Эта клетка уже занята, повторите попытку"
      return false
    end
  end
end

class Game
  attr_accessor :player, :winner

  def initialize
    @player = "X"
    @winner = false
  end

  def switch_player
    @player == "X" ? @player = "0": @player = "X"
  end

  def check_value(value)
    if (value > 9) || (value < 1)
      puts "Повторите попытку"
      return true
    end
  end
end

board = Board.new
game = Game.new

board.display_board
until game.winner
  print("Сейчас ходит игрок #{game.player}, введите номер клетки от 1 до 9: ")
  index_of_cells = gets.chomp.to_i
  game.check_value(index_of_cells) ? next : nil
  board.change_board(index_of_cells - 1, game.player) ? nil :next
  system("reset")
  board.display_board
  game.switch_player
  board.check_winner
end
