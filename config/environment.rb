require 'bundler'
Bundler.require
require 'yaml'
require 'json'
require 'pry'
require 'rest-client'
require_relative '../application.rb'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger=nil
require_all 'lib'
