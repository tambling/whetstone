module ImageHelper
  def top_image(url)
		root_url           = "#{URI(url).scheme}://#{URI(url).host}"
		
		og_image         = check_og_image(root_url)
    apple_image      = check_apple_image(url)
    mechanize_search = mechanize_search(url)

    if og_image
    	return og_image
    elsif apple_image
    	return apple_image
    else
    	"#{File.expand_path(Rails.root.join('public', 'image-dne.jpg'))}"
    end
  end

  def check_og_image(url)
    begin 
	    og_image = Nokogiri::HTML(open(url)).css('meta[property="og:image"]')
	    og_image.first.attributes["content"].value if og_image
	  rescue
	  	nil
	  end
  end

  def check_apple_image(url)
    begin
	    doc = Nokogiri::HTML(open(url))
	    apple_touch_image = doc.css('link[rel="apple-touch-icon-precomposed"]')
	    apple_touch_image.first.attributes["href"].value if apple_touch_image
    rescue
      nil
    end
  end

	def mechanize_search(url)
		host = URI(url).host
		sanintized_url = host[/\.[a-zA-Z]+\./].gsub(/\./, '')
		agent = Mechanize.new
		agent.get("http://www.google.com/imghp?hl=en&tab=wi")
		form = agent.page.form
		form.q = sanintized_url
		form.submit
		images = agent.page.links_with(href: /imgres/)
		agent.click(images[0])
		agent.page.link_with(:text => "See full size image").uri.to_s
  end
end
