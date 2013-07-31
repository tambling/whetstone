require 'spec_helper'

describe "ImageHelper" do
  let(:og_image_url)     {"http://ogp.me/"}
  let(:apple_link_url)   {"http://www.karlribas.com/"}
  let(:random_image) {"http://mcclure.org/vidal"} 

  it "should test for og images" do
    expect(top_image(og_image_url)).to eq("http://ogp.me/logo.png")    
  end

  it "should test for apple images" do
    expect(top_image(apple_link_url)).to eq("http://www.karlribas.com/images/apple-touch-icon-precomposed.png")
  end  

  it "should Google images" do
    expect(top_image(random_image)).to be_kind_of(String)
  end

  it "should return image does not exist for bad url" do
    expect(top_image("dfgjfdgnfdkjgjsd")).to eq("../image-dne.jpg")
  end
end
