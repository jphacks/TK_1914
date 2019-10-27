require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/reloader'
require 'bundler/setup'
require 'json'

require 'rqrcode'
require './models/index.rb'
require './utils/CloudinaryHelper.rb'

require 'sinatra/cross_origin'

Bundler.require
Dotenv.load

configure do
  enable :cross_origin
end

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

def make_qr(url='https://twitter.com/niza_lit')
  RQRCode::QRCode.new(url, size: 5, level: :h).as_svg
end

post '/api/v1/users/new' do
  baseUrl = 'https://becky-484f7.firebaseapp.com/profile/'
  image_url = CloudinaryHelper.upload(params[:file][:tempfile])
  @user = User.new(name: params[:name], nick_name: params[:nick_name], img: image_url, comment: params[:comment])
  if @user.save
    url = baseUrl + @user.id
    qr = make_qr(url)
    @user.update(qr: qr)
    params[:links].each do |link|
      @user.link.create(media_platform_id: link.id, url: link.url)
    end
  end
  @user.to_json(include: [{links: {include: :media_platform}}])
  user.to_json
end

# ユーザー情報取得
get '/api/v1/users/:id' do
  @user = User.find_by_id(params[:id])
  content_type :json
  @user.to_json(include: [{links: {include: :media_platform}}])
end

get '/api/v1/medias' do
  medias = MediaPlatform.all
  content_type :json
  medias.to_json
end

options "*" do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end