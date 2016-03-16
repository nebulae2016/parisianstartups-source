require 'slim'
require 'sass'
require 'coffee-script'

Time.zone = "Paris"

###
# Page options, layouts, aliases and proxies
###

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

configure :development do
  activate :livereload
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :directory_indexes

startups = JSON.load(open("https://nebulae-dashboard.herokuapp.com/startups-index.json"))
startups.each do |s|
  proxy "/#{s["name"].downcase.split(" ").join("-")}/index.html", "/startup-template.html", :locals => {  name:         s["name"],
                                                                                                                            summary:      s["summary"],
                                                                                                                            founders:     s["founders"],
                                                                                                                            website_url:  s["website_url"] }, ignore: true
end


# Build-specific configuration
configure :build do
  # Minify CSS on build
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript
end