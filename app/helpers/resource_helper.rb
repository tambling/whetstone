module ResourceHelper
  def top_image_url(query)
    sanitized_query  = query.downcase.gsub(/[^0-9a-z]/i, ' ').rstrip + "logo"
    agent = Mechanize.new
    agent.get("http://www.google.com/imghp?hl=en&tab=wi")
    form = agent.page.form
    form.q = sanitized_query
    form.submit
    images = agent.page.links_with(href: /imgres/)
    # Filter .png s
    agent.click(images[0])
    agent.page.link_with(:text => "See full size image").uri.to_s
  end
end
