#!/usr/bin/env ruby

# Libraries:::::::::::::::::::::::::::::::::::::::::::::::::::::::
require 'rubygems'
require 'sinatra/base'
require 'slim'
require 'sass'
require 'coffee-script'
require 'sprockets'

 
# Application:::::::::::::::::::::::::::::::::::::::::::::::::::

class Assets < Sinatra::Base
  # Adapted from http://mutelight.org/asset-pipeline
  configure do
    set :assets, (Sprockets::Environment.new { |env|
      env.append_path(settings.root + "/")

      # Compress everything in production
      if ENV["RACK_ENV"] == "production"
        env.js_compressor  = YUI::JavaScriptCompressor.new
        env.css_compressor = YUI::CssCompressor.new
      end
    })
    
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


