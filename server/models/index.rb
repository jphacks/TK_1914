require 'bundler/setup'
Bundler.require

if development?
  ActiveRecord::Base.establish_connection('sqlite3:db/development.db')
end

require_relative './users.rb'
require_relative './links.rb'
require_relative './media_platforms.rb'