class GameController < ApplicationController
  # This action is for the bare domain. You can ignore it.
  def home
    redirect_to('/mockup.html')
  end

  def rps
    # variable declaration and win/loss logic
    @player_move = params['move']
    @computer_move = ['rock','paper','scissors'].sample
    if @player_move == @computer_move
      @outcome = 'tie'
    else
      if @player_move == 'rock'
        @computer_move == 'scissors' ? @outcome = 'win' : @outcome = 'lose'
      elsif @player_move == 'paper'
        @computer_move == 'rock' ? @outcome = 'win' : @outcome = 'lose'
      elsif @player_move == 'scissors'
        @computer_move == 'paper' ? @outcome = 'win' : @outcome = 'lose'
      end
    end

    # database entry
    new_move = Move.new
    new_move.user_move = @player_move
    new_move.computer_move = @computer_move
    new_move.user_wins = 0
    new_move.computer_wins = 0
    new_move.tie = 0
    if @outcome == 'win'
      new_move.user_wins = 1
    elsif @outcome == 'lose'
      new_move.computer_wins = 1
    elsif @outcome == 'tie'
      new_move.tie = 1
    end
    new_move.save

    # database read for summary tables


    render(@player_move)
  end

end
