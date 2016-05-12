require 'slim'
require 'sass'
require 'coffee-script'

###
# Page options, layouts, aliases and proxies
###

Time.zone = "Paris"
set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
# set :partials_dir, 'partials' // this is not working regardless of the layout file extenssion .html.slim)
# Per-page layout changes:
#
# With no layout
#
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

###
# General configuration
###

configure :development do
  activate :livereload
end

###
# Helpers
###

require "lib/view_helpers"
helpers ViewHelpers

###
# Generate startup pages dynamically
###

activate :directory_indexes
activate :sprockets do |c|
  # with next iteration put in sites directory
  c.imported_asset_path = '/lib/'
end

startups = JSON.load(open("https://nebulae-dashboard.herokuapp.com/startups-index.json"))
startups.each do |s|
  proxy "/#{s["name"].downcase.split(" ").join("-")}/index.html", 
        "/startup-template.html",
        :layout => "startup-layout",
        :locals => {  name:             s["name"],
                      summary:          s["summary"],
                      founders:         s["founders"],
                      address:          s["address"],
                      employee_count:   s["employee_count"],
                      website_url:      s["website_url"],
                      twitter_url:      s["twitter_url"],
                      logo_url:         s["logo_url"],
                      market_domain:    s["market_domain"] }, 
        ignore: true
end

configure :build do
  activate :relative_assets
  activate :minify_css
  activate :minify_javascript
	# don't hash the fonts
	activate :asset_hash, ignore: Proc.new {|x| x.include?('.woff') || x.include?('.ttf') || x.include?('.eot') || x.include?('sharepay') || x.include?('tables')}
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.remote = "https://#{ENV['GH_TOKEN']}@github.com/nebulae2016/parisianstartups.git"
  deploy.build_before = true
  deploy.commit_message = "Automated build & deploy at #{Time.now}"
end

activate :google_analytics do |ga|
  ga.tracking_id = 'UA-76972340-1'
  ga.domain_name = 'parisianstartups.com'
  ga.enhanced_link_attribution = true
  ga.development = false
end
