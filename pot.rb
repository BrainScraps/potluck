require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'sinatra/resources'
require 'require_all'

require_relative "db.rb"
require_all "models"
