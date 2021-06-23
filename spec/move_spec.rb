require 'rails_helper'

describe "post a request to get computer move", :type => :request do

  xit 'returns success message' do
    post '/move', params: { :state => ['X','X','X','X',4,'X','X','X','X'], :type => 'computer' }
    expect(JSON.parse(response.body)['message']).to eq('successful')
  end

  xit 'returns right computer move' do
    post '/move', params: { :state => ['X','X','X','X',4,'X','X','X','X'], :type => 'computer' }
    expect(JSON.parse(response.body)['move']).to eq(4)
  end

  xit 'returns right smart computer move' do
    post '/move', params: { :state => %w[X O X O O X 6 7 8], :type => 'smart_computer' }
    expect(JSON.parse(response.body)['move']).to eq(6)
  end
  

  it 'returns invalid message when making a human move to terminal game state' do
    post '/move', params: { :state => %w[O O O X O X X O X], :type => 'human', :symbol => 'O'}
    # expect(JSON.parse(response.body)['move']).to eq(3)
    expect(JSON.parse(response.body)['game_state']).to eq('win')
    # expect(JSON.parse(response.body)['game_state']).not_to eq('playing')
  end
  
  it 'returns valid computer move and valid message' do
    post '/move', params: { :state => %w[O O 2 X O X X O X], :type => 'human', :symbol => 'O'}
    # expect(JSON.parse(response.body)['move']).to eq(3)
    expect(JSON.parse(response.body)['game_state']).to eq('playing')
    # expect(JSON.parse(response.body)['game_state']).not_to eq('playing')
  end
end