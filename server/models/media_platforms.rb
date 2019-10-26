require_relative './index.rb'
require 'bundler/setup'
Bundler.require
ActiveRecord::Base.establish_connection('sqlite3:db/development.db')

class MediaPlatform < ActiveRecord::Base
  has_many :links
end