require_relative './index.rb'
require 'bundler/setup'
Bundler.require

class User < ActiveRecord::Base
  has_many :links
end