require './players'
require './questions'

class Game
  def initialize
    puts"-------------------------------"
    puts"----------BEGIN GAME-----------"
    puts"-------------------------------"
    puts "Player 1's name: "
    player1_name = gets.chomp
    puts "Player 2's name: "
    player2_name = gets.chomp

    # if player1_name == nill
    #     player1_name = "Bob"
    # elsif player2_name == nill
    #     player1_name = "Jack"
    # else
      @player1 = Players.new(player1_name)
      @player2 = Players.new(player2_name)

      @current_player = @player1
      @other_player = @player2
    # end

    while (@player1.alive? && @player2.alive?) do
      play_turn
      switch_player
    end

    if @player1.lives == 0
      puts "#{@player2.name} wins!!!!"
      puts"-------------------------------------"
      puts"--------------GAME OVER--------------"
      puts"-------------------------------------"

    elsif @player2.lives == 0
      puts "#{@player1.name} wins!!!!"
      puts"-------------------------------------"
      puts"--------------GAME OVER--------------"
      puts"-------------------------------------"    end
  end

  def play_turn
    puts "\n-------------NEW TURN---------------\n"
    puts "#{@current_player.name} to play:"
    @question = Questions.new
    answer = gets.chomp.to_i

    if answer == @question.answer
      puts "CORRECT!"
      puts "#{@current_player.name} #{@current_player.lives}/3 lives and #{@other_player.name} #{@other_player.lives}/3 lives"
    else
      puts "!"
      @current_player.lives = @current_player.lives - 1
      puts "#{@current_player.name} #{@current_player.lives}/3 lives and #{@other_player.name} #{@other_player.lives}/3 lives"
    end
  end

  def switch_player
    @current_player = @current_player == @player1 ? @player2 : @player1
    @other_player = @other_player == @player2 ? @player1 : @player2
  end

end
