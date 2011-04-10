require 'rubygems'
require 'bundler'
require 'rack/rewrite'

use Rack::Rewrite do
  r301 %r{.*}, 'http://camerondaigle.com$&',
    :if => Proc.new { |rack_env| rack_env['SERVER_NAME'] != 'camerondaigle.com' && ENV['RACK_ENV'] == 'production' }
  r301 '/v1/information', '/about'
  r301 %r{/articles/welcome_to_the_dot_com_elegant_edition/?}, '/articles/from_expressionengine_to_sinatra_and_heroku' 
  r301 '/v1/articles/regarding_positionfixed_in_mobile_safari/', '/articles/regarding_fixed_positioning_in_mobile_safari'
  r301 %r{/v1/articles/(.*)}, '/articles/$1'
end

Bundler.require

require './camerondaigle'
run Sinatra::Application