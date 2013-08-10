require 'rubygems'
require 'bundler'
 
Bundler.require
require './app'
 
namespace :assets do
  desc 'compile assets'
  task :compile => [:compile_js, :compile_css] do
  end
 
  desc 'compile javascript assets'
  task :compile_js do
    sprockets = Assets.settings.assets

    Assets.settings.assets_precompile_js.each do |js|
      puts "compiling #{js}"
      asset     = sprockets[js]
      outpath   = File.join(Assets.settings.assets_path, 'js')
      outfile   = Pathname.new(outpath).join(js.insert(js.rindex('.'), '.min')) # may want to use the digest in the future?
   
      FileUtils.mkdir_p outfile.dirname
   
      asset.write_to(outfile)
      asset.write_to("#{outfile}.gz")
    end
    puts "successfully compiled js assets"
  end
 
  desc 'compile css assets'
  task :compile_css do
    sprockets = Assets.settings.assets

    Assets.settings.assets_precompile_css.each do |css|
      puts "compiling #{css}"
      asset     = sprockets[css]
      outpath   = File.join(Assets.settings.assets_path, 'css')
      outfile   = Pathname.new(outpath).join(css.insert(css.rindex('.'), '.min')) # may want to use the digest in the future?
   
      FileUtils.mkdir_p outfile.dirname
   
      asset.write_to(outfile)
      asset.write_to("#{outfile}.gz")
    end
    puts "successfully compiled css assets"
  end
  # todo: add :clean_all, :clean_css, :clean_js tasks, invoke before writing new file(s)
end

