module ImageHelper
  require 'open-uri'

  # Returns a relevant image url from a resource
  def top_image(url)
    og_image         = check_og_image(url)
    apple_image      = check_apple_image(url)
    mechanize_search = mechanize_search(url)
    if og_image
      return og_image
    elsif apple_image
      return apple_image
    elsif mechanize_search
      mechanize_search  
    # In case all else fails ...
    else
      "../image-dne.jpg"
    end
  end
  
  # Checks for open graph thumbnail
  def check_og_image(url)
    begin 
      og_image = Nokogiri::HTML(open(url)).css('meta[property="og:image"]')
      og_image.first.attributes["content"].value if og_image
    rescue
      nil
    end
  end

  # Checks for apple touch thumbnail
  def check_apple_image(url)
    begin
      doc = Nokogiri::HTML(open(url))
      apple_touch_image = doc.css('link[rel="apple-touch-icon-precomposed"]')
      apple_touch_image.first.attributes["href"].value if apple_touch_image
    rescue
      nil
    end
  end

  # Mechanizes Google search
  def mechanize_search(url)
    begin
      sanintized_url = sanitize_url URI(url).host
      agent = Mechanize.new
      agent.get("http://www.google.com/imghp?hl=en&tab=wi")
      form = agent.page.form
      form.q = sanintized_url
      form.submit
      images = agent.page.links_with(href: /imgres/)
      agent.click(images[0])
      agent.page.link_with(:text => "See full size image").uri.to_s
    rescue
      nil
    end
  end

  # Finds the relevant bits of a URL string
  def sanitize_url(url)
    # URL matches 'www'
    if url =~ /w{3}/
      sterilize url.split(/\./)[1]
    # URL does not match 'www'
    else
      first_parts = url.split(/\./)[0..1]
      scheme_eliminated = first_parts.map {|part| part.gsub(/[a-zA-Z]+\W+/, '')}.join(' ')
      sterilize(scheme_eliminated) 
    end
  end

  # Removes pesky punctuation
  def sterilize(partial_url)
    partial_url =~ /\W/ ? partial_url.gsub(/\W/, ' ').split(' ').join(' ') : partial_url
  end
end
