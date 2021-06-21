require 'tic-tac-toe'

class GameController < ApplicationController

  def index
    render json: {"message":"Server online"}
  end

  def check
    board_state = params[:state]
    symbol = params[:symbol]
    game_state = 'playing'
    if TicTacToe.win?(board_state, symbol)
      game_state = 'win'
    elsif TicTacToe.draw?(board_state)
      game_state = 'draw'
    end
    render json: { "state":game_state, "message":"successful"}
  end


  # api/move


  validate a human move and return state of the game

  make a computer move and return state of the game
  
  send a move and current board state

  def move
    # TicTacToe.move(game_state, computer_player_type, player2_type, move)
    board_state = params[:state]
    computer_player_type = params[:type]
    move = 0
    move = computer_player_type == 'computer' ? TicTacToe.computer_move(board_state, 1, 'X') : TicTacToe.smart_computer_move(board_state, 1, 'X')
    render json: { "move":move, "message":"successful"}
  end
end
