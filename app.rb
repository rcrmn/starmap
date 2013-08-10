#!/usr/bin/env ruby

# Libraries:::::::::::::::::::::::::::::::::::::::::::::::::::::::
require 'rubygems'
require 'sinatra/base'
require 'slim'
require 'sass'
require 'coffee-script'
require 'sprockets'

 
# Application:::::::::::::::::::::::::::::::::::::::::::::::::::

class SassHandler < Sinatra::Base

  set :views, File.dirname(__FILE__) + '/'
  
  get '/*.css' do
    filename = params[:splat].first
    sass filename.to_sym
  end
    
end
 
class CoffeeHandler < Sinatra::Base

  set :views, File.dirname(__FILE__) + '/'
  
  get "/*.js" do

    if File.exists?(File.join(settings.views, params[:splat].first + ".js"))
      send_file File.join(settings.views, params[:splat].first + ".js")
    else
      filename = params[:splat].first
      coffee filename.to_sym
    end

  end

end
 
class App < Sinatra::Base
  use SassHandler
  use CoffeeHandler
  
  # Configuration:::::::::::::::::::::::::::::::::::::::::::::::
  set :public_dir, File.dirname(__FILE__) + '/'
  set :views, File.dirname(__FILE__) + '/'
  
  # Route Handlers::::::::::::::::::::::::::::::::::::::::::::::
  get '/' do
      slim :index
  end
        
end


