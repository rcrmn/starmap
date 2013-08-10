#!/usr/bin/env ruby

# Libraries:::::::::::::::::::::::::::::::::::::::::::::::::::::::
require 'rubygems'
require 'sinatra/base'
require 'slim'
require 'sass'
require 'coffee-script'
require 'sprockets'

  
  # Assets pipeline and precompilation
  # Adapted from http://mutelight.org/asset-pipeline
  # and also from https://gist.github.com/jeffreyiacono/1772989
 
# Application:::::::::::::::::::::::::::::::::::::::::::::::::::

class Assets < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :assets, (Sprockets::Environment.new(root) { |env| env.logger = Logger.new(STDOUT) })
  set :assets_prefix, 'compiled'
  set :assets_path, File.join(root, 'public', assets_prefix)

  set :assets_precompile_js, %w( starmap.js )
  set :assets_precompile_css, %w(  )

  configure do
    assets.append_path(root)
  end
  # we are deploying to heroku, which does not have a JVM, which YUI needs, so let's
  # only require and config the compressors / minifiers for dev env
  configure :development do
    if ENV["RACK_ENV"] == "production"
      require 'yui/compressor'
      require 'uglifier'
      assets.css_compressor = YUI::CssCompressor.new
      assets.js_compressor  = Uglifier.new(mangle: true)
    end
  end
  

  get "/*.js" do
    content_type("application/javascript")
    settings.assets["#{params[:splat].first}.js"]
  end

  get "/*.css" do
    content_type("text/css")
    settings.assets["#{params[:splat].first}.css"]
  end

  %w{jpg png}.each do |format|
    get "/*.#{format}" do |image|
      content_type("image/#{format}")
      settings.assets["#{params[:splat].first}.#{format}"]
    end
  end
  
end

 
class App < Sinatra::Base
  
  # Configuration:::::::::::::::::::::::::::::::::::::::::::::::
  set :public_dir, File.dirname(__FILE__) + '/'
  set :views, File.dirname(__FILE__) + '/'
  
  # Route Handlers::::::::::::::::::::::::::::::::::::::::::::::
  get '/' do
      slim :index
  end
        
end


