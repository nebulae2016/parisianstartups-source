module ViewHelpers
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

	def strip_link(incoming_url)

		def strip_www(url)
			if url.nil?
			elsif url.include?('www.')
				url.gsub('www.', '')
			else
				url
			end
		end

		def strip_http_https(url)
			if url.nil?
			elsif url.include?('http://')
				url.gsub('http://', '')
			elsif url.include?('https://')
				url.gsub('https://', '')
			else
				url
			end
		end

		def strip_twitter(url)
			if url.nil?
			elsif url.include?('twitter.com/')
				url.gsub('twitter.com/', '')
			else
				url
			end
		end

		www_stripped = strip_www(incoming_url)
		http_https_stripped = strip_http_https(www_stripped)
		twitter_stripped = strip_twitter(http_https_stripped)

		result = twitter_stripped
		return result
	end
	
	def words_limit(text, limit)
		string_arr = text.split(' ')
		string_arr.count > limit ? "#{text[0..(limit-1)].join(' ')}..." : text
	end
	
	def root_url(rel_link)
		"http://parisianstartups.com/#{rel_link}"
	end

	require 'open-uri'
	require 'json'

	def fetch_startups
		@startups = JSON.load(open("https://nebulae-dashboard.herokuapp.com/startups-index.json"))
		@fetch_time = Time.now
	end

	def startups_in_domain(domain)
		return @startups.select{|s| s["market_domain"] == domain }
	end

	def helper_test
		return "yalalallaaaa"
	end

	def nav_anchor_helper(current_url, target)
		target_link = target
		if current_url == "/"
			return "##{target_link}"
		else
			return "/##{target_link}"
		end
	end
end
