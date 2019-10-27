require_relative './index.rb'
require 'bundler/setup'
Bundler.require

class MediaPlatform < ActiveRecord::Base
  has_many :links
end