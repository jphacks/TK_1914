require 'bundler/setup'
Bundler.require
Dotenv.load

class CloudinaryHelper
  def self.upload(image)
    # imgの処理変わるかも
    load_config
    Cloudinary::Uploader.upload(image)['url']
  end

  def self.load_config
    Cloudinary.config do |config|
      config.cloud_name = ENV['CLOUDINARY_NAME']
      config.api_key = ENV['CLOUDINARY_API_KEY']
      config.api_secret = ENV['CLOUDINARY_API_SECRET']
    end
  end
end