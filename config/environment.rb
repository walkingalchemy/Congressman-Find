require 'bundler'
Bundler.require
require 'yaml'
require 'json'
require 'pry'
require 'rest-client'


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
