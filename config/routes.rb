Rails.application.routes.draw do
  resources :games do
    collection do
      post :health_check
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/game/', controller: 'game', action:'check'
  get '/game/', controller: 'game', action:'index'
  post '/move/', controller: 'game', action:'move'

end
