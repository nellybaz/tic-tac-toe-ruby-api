require 'rails_helper'

describe "post a request to get computer move", :type => :request do

  it 'returns success message' do
    post '/move', params: { :state => ['X','X','X','X',4,'X','X','X','X'], :type => 'computer' }
    expect(JSON.parse(response.body)['message']).to eq('successful')
  end

  it 'returns right computer move' do
    post '/move', params: { :state => ['X','X','X','X',4,'X','X','X','X'], :type => 'computer' }
    expect(JSON.parse(response.body)['move']).to eq(4)
  end

  it 'returns right smart computer move' do
    post '/move', params: { :state => %w[X O X O O X 6 7 8], :type => 'smart_computer' }
    expect(JSON.parse(response.body)['move']).to eq(6)
  end
  
end