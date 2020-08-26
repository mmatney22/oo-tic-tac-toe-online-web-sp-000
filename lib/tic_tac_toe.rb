class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8) ? true : false
  end

  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token == "O"
    counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter a number between 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Whoops! That's not a valid move."
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
    position_1 = @board[win_combo[0]]
    position_2 = @board[win_combo[1]]
    position_3 = @board[win_combo[2]]

    position_1 == position_2 && position_2 == position_3 &&
    position_taken?(win_combo[0])
    end
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    won? && @board[won?[0]]
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
