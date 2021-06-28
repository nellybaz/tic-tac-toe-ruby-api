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


  def move
    board_state = params[:state]
    type = params[:type]
    symbol = params[:symbol]
    response  = TicTacToe.move(type, board_state, symbol)

    render json: response
  end
end
