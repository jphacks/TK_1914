require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/reloader'
require 'bundler/setup'
require 'json'

require 'rqrcode'
require './models/index.rb'
require './utils/CloudinaryHelper.rb'

require 'sinatra/cross_origin'
require 'securerandom'

Bundler.require
Dotenv.load

configure do
  enable :cross_origin
end

before do
  response.headers['Access-Control-Allow-Origin'] = '*'
end

def uniq_file_name
  "#{SecureRandom.hex}.png"
end

def make_qr(url='https://twitter.com/niza_lit', user)
  qr = RQRCode::QRCode.new(url, size: 7, level: :h).as_png
  file = qr.save("tmp/#{uniq_file_name}")
  return file
end

post '/api/v1/users/new' do
  baseUrl = 'https://becky-484f7.firebaseapp.com/profile/'
  request.body.rewind
  params = JSON.parse request.body.read
  image_url = CloudinaryHelper.upload(params['img'])
  @user = User.new(name: params['name'], nick_name: params['nickname'], img: image_url, comment: params['comment'])
  if @user.save
    url = baseUrl + @user.id.to_s
    qr = make_qr(url)
    qr_url = CloudinaryHelper.upload(qr.path)
    File.delete(qr.path)
    @user.update(qr: qr_url)
    if params['links'].nil?
      links = [
        {id: 1 , url: 'https://twitter.com/niza_lit'},
        {id: 2 , url: 'https://twitter.com/niza_lit'},
        {id: 3 , url: 'https://twitter.com/niza_lit'}
      ]
    else
      links = params['links']
    end
    links.each do |link|
      @user.links.create(media_platform_id: link['id'], url: link['url'])
    end
  end
  content_type :json
  @user.to_json(include: [{links: {include: :media_platform}}])
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

# get '/api/v1/users/:id/qr' do
#   baseUrl = 'https://becky-484f7.firebaseapp.com/profile/'
#   @user = User.find_by_id(params[:id])
#   content_type :json
#   @user.qr.to_json
# end

options "*" do
  response.headers["Allow"] = "GET, PUT, POST, DELETE, OPTIONS"
  response.headers["Access-Control-Allow-Headers"] = "Authorization, Content-Type, Accept, X-User-Email, X-Auth-Token"
  response.headers["Access-Control-Allow-Origin"] = "*"
  200
end

get '/' do
  erb :index
end