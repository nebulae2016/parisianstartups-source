module StartupTemplateHelpers
  def startup_title_helper
    if current_page.locals[:name]
      current_page.locals[:name] + " - " + data.site.title
    else
      data.site.title
    end
  end

  def startup_description_helper
    if  current_page.locals[:name] && 
        current_page.locals[:market_domain] &&
        current_page.locals[:founders] &&
        current_page.locals[:address]
      name = current_page.locals[:name]
      market_domain = current_page.locals[:market_domain]
      founders = current_page.locals[:founders]
      address = current_page.locals[:address]

      return "#{name.capitalize} is a startup that is involved in #{market_domain}. It's founders are #{founders} and they are based at #{address}."
    else
      "Is a startup based in Paris. They employ multiple people and are interested in expanding their business."
    end
  end

  def startup_image_helper
    current_page.locals[:logo_url] ||= 'http://gph.is/148YzQp'
  end

  # def strip_link(url)
  #   def strip_www(url)
  #     if url.include?('www.')
  #       url.gsub('www.', '')
  #     end
  #   end

  #   def strip_http_https(url)
  #     if url.include?('http://')
  #       url.gsub('http://','')
  #     elsif url.include?('https://')
  #       url.gsub('https://', '')
  #     elsif url.include?('https://twitter.com/')
  #       url.gsub('https://twitter.com', '')
  #     else
  #       url
  #     end
  #   end

  #   url1 = strip_www(url)
  #   url2 = strip_http_https(url1)
  #   return url2
  # end
    
end
