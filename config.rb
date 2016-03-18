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

require "lib/startup_template_helpers"
helpers StartupTemplateHelpers


###
# Generate startup pages dynamically
###

activate :directory_indexes

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
end

activate :deploy do |deploy|
  deploy.deploy_method = :git
  deploy.remote = "https://#{ENV['GH_TOKEN']}@github.com/nebulae2016/parisianstartups.git"
  deploy.build_before = true
  deploy.commit_message = "Automated build & deploy at #{Time.now}"
end
