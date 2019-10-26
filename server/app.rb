require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/reloader'
require 'bundler/setup'
require 'json'

require 'rqrcode'
require 'pry'
require './models/index.rb'
require './utils/CloudinaryHelper.rb'

Bundler.require
Dotenv.load

def make_qr(url='https://twitter.com/niza_lit')
  RQRCode::QRCode.new(url, size: 5, level: :h).as_svg
end

post '/api/v1/users/new' do
  baseUrl = 'https://becky-484f7.firebaseapp.com/profile/'
  image_url = CloudinaryHelper.upload(params[:file][:tempfile])
  @user = User.new(name: params[:name], nick_name: params[:nick_name], img: image_url)
  if @user.save
    url = baseUrl + @user.id
    qr = make_qr(url)
    @user.update(qr: qr)
    params[:links].each do |link|
      @user.link.create(media_id: link.id, url: link.url)
    end
  end
  @user.includes({link: [:media]}).to_json
end

# ユーザー情報取得
get '/api/v1/users/:id' do
  @user = User.find(params[:id])
  content_type :json
  @user.includes({link: [:media]}).to_json
end

get '/api/v1/medias' do
  medias = MediaPlatform.all
  content_type :json
  medias.to_json
end
