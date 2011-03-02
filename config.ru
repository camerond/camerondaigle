require 'rubygems'
require 'bundler'
require 'rack/rewrite'

use Rack::Rewrite do
  r301 '/v1/information', '/about'
  r301 %r{/v1/articles/(.*)}, '/articles/$1'
end

Bundler.require

require './camerondaigle'
run Sinatra::Application