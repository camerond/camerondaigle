require 'sinatra'
require 'yaml'
require 'haml'
require 'tilt'
require 'glorify'
require 'nokogiri'

require "sinatra/reloader" if development?
require 'hassle' if production?

class Tilt::HamlTemplate
  module ::Haml::Filters::Markdown
    def render(text)
      Redcarpet::Render::SmartyPants.render text
    end
  end
end

before do
  response.headers['Cache-Control'] = 'public, max-age=604800' if production?
end

get "/physical/?" do
  haml :'/physical/index'
end

get "/digital/?" do
  haml :'/digital/index'
end

get "/about/?" do
  haml :'/pages/about'
end

get "/articles/?" do
  @articles = load_structure('articles')
  haml :'/articles/index'
end

get "/articles/:article/?" do
  file = "views/articles/#{params[:article]}.markdown"
  if File.exist?(file)
    @articles = load_structure('articles')
    load_into_haml('/articles/show', file)
  else
    404
  end
end

get '/stylesheets/*.css' do |f|
  sass ('/stylesheets/sass/' + f).to_sym
end

get '/feed/?' do
  @articles = load_structure('articles');
  @latest_article_date = Time.parse(@articles[0][:published]).rfc822
  nokogiri :'/feed/articles'
end

get '/' do
  haml :'/index', :layout => false
end

error 404 do
  haml :'/pages/notfound', :layout => false
end

helpers do
  def load_into_haml(template, file)
    article = File.read(file).split("---\n")
    @meta = YAML::load(article[0])
    @text = article[1]
    haml template.to_sym
  end
  def load_structure(dir)
    YAML::load(File.open("views/#{dir}/_structure.yaml"))
  end
  def nav_item(name)
    selected = (request.path.index(name.downcase) == 1) ? 'selected' : ''
    "<li class='#{selected}'><a href='/#{name.downcase}'>#{name}</a></li>"
  end
  def selected_class_for(a)
    "selected" if request.path_info[a[:slug]]
  end
  def pretty_date(date)
    Date.parse(date).strftime('%B %e, %Y')
  end
  def smart_glorify(text)
    Redcarpet::Render::SmartyPants.render(glorify(text))
  end
end

use Hassle if production?

