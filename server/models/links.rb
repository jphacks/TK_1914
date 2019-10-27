require_relative './index.rb'
require 'bundler/setup'
Bundler.require

class Link < ActiveRecord::Base
  belongs_to :user
  belongs_to :media_platform
end