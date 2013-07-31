require 'spec_helper'

describe "ImageHelper" do
  let(:random_image) {"http://mcclure.org/vidal"} 
  let(:og_image)     {Nokogiri::HTML(open("http://ogp.me/"))}
  let(:apple_link)   {Nokogiri::HTML(open("http://www.karlribas.com/"))}

  it "should always find an image" do
    expect(URI.extract(top_image(random_image)).length).to eq(1)
  end

  it "should test for og images" do
    image_url = og_image.css('meta[property="og:image"]').first.attributes["content"].value
    expect(URI.extract(image_url).length).to eq(1)    
  end

  it "should test for apple images" do
    image_url = apple_link.css('link[rel="apple-touch-icon-precomposed"]').first.attributes["href"].value
    expect(URI.extract(image_url).length).to eq(1)
  end

  it "should Google images" do
    expect(mechanize_search(random_image)).to be_kind_of(String)
  end

  it "should sanitize urls" do
    sanitize_url(random_image)
    debugger
    expect().to eq(1)
  end
end
