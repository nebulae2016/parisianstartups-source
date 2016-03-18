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
end
