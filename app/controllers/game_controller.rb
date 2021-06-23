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


  # validate a human move and return state of the game

  # make a computer move and return state of the game
  
  # send a move and current board state

  def move
    board_state = params[:state]
    type = params[:type]
    # move = params[:move]
    symbol = params[:symbol]
    response  = TicTacToe.move(type, board_state, symbol)

    # move = 0
    # move = type == 'computer' ? TicTacToe.computer_move(board_state, 1, 'X') : TicTacToe.smart_computer_move(board_state, 1, 'X')
    render json: response
  end
end
