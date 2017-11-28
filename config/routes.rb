Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'websockets#index'
  get '/websocket', to: 'websockets#init_websocket'
  post '/', to: 'websockets#create_websocket'
end
