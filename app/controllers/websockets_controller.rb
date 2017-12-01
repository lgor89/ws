class WebsocketsController < ApplicationController
  require 'faye/websocket'

  def index
    @websocket = User.find(1).websockets.new()
  end

  def create_websocket
    websocket = Websocket.new(host: params[:websocket][:host])
    if websocket.save
        render template: 'websockets/open_websocket'
    end
  end

  def init_websocket
    env = request.env
    if Faye::WebSocket.websocket?(env)
      ws = Faye::WebSocket.new(env)
      ws.on :open do |event|

      end
      ws.on :message do |event|
        ws.send('you sended message: '+ event.data)
      end

      ws.on :close do |event|
        p [:close, event.code, event.reason]
        ws = nil
      end

      # Return async Rack response
      ws.rack_response

    else
      # Normal HTTP request
      render html: 'wrong hostname'
    end
  end
end
