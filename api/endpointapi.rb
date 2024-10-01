require 'sinatra'
require 'sinatra/reloader' if development?
require 'json'
require_relative 'controllers/my_controller'

class MyApp < Sinatra::Base
  before do
    @controller = MyController.new
  end

  get '/' do
    { message: "Bem-vindo à API Sinatra!" }.to_json
  end

  get '/hello' do
    content_type :json
    @controller.hello.to_json
  end

  get '/info' do
    content_type :json
    @controller.info.to_json
  end

  run! if app_file == $0
end