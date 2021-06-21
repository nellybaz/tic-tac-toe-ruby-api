require 'rails_helper'


describe "post a request to check game", :type => :request do
  # before do
    
  # end

  it 'returns success message' do
    post '/game', params: { :state => ["O", "O", "X", "X", "X", "O", "O", "X", "X"], :symbol => 'X' }
    expect(JSON.parse(response.body)['message']).to eq('successful')
  end

  describe 'returns correct messages for game still playing' do
    it 'draw' do
      post '/game', params: { :state => ["O", "O", "X", "X", "X", "O", "O", "X", "9"], :symbol => 'X',  }
      expect(JSON.parse(response.body)['state']).to eq('playing')
    end
  end

  describe 'returns correct messages for draws' do
    it 'draw' do
      post '/game', params: { :state => ["O", "O", "X", "X", "X", "O", "O", "X", "X"], :symbol => 'X',  }
      expect(JSON.parse(response.body)['state']).to eq('draw')
    end
  end

  describe 'returns right messages for wins' do
    it 'win in columns' do
      post '/game', params: { :state => ['X', '.', '.', 'X', '.', '.', 'X', '.', '.'], :symbol => 'X',  }
      expect(JSON.parse(response.body)['state']).to eq('win')
    end
    
  
    it 'wins in rows' do
      post '/game', params: { :state => ['X', 'X', 'X', '.', '.', '.', '.', '.', '.'], :symbol => 'X',  }
      expect(JSON.parse(response.body)['state']).to eq('win')
    end
  end

  
end